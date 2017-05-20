from flask import Flask
from flask import jsonify
from flask import url_for
from flask import abort
from flask import make_response
from flask import request

# Import the service which servers the data.
# This could be a service which loads the data
# from database or files or some website.
from data_provider_service import DataProviderService

DATA_PROVIDER = DataProviderService(15)

# create the Flask application
app = Flask(__name__)



# ROUTING:
#	One way to configure routing is to use the @app.route() decorator
#
@app.route("/api", methods=["GET"])
def list_routes():
	result = []
	for rt in app.url_map.iter_rules():
		result.append({
			"methods": list(rt.methods),
			"route": str(rt)
		})
	return jsonify({"routes": result, "total": len(result)})




def candidate():
	candidates = DATA_PROVIDER.get_candidates();
	return jsonify({"candidates": candidates, "total": len(candidates)})

# ROUTING:
# 	Another way to configure routes is through the add_url_rule() method
#	
#	1st parameter (/api/candidate) - route path
#	2nd parameter (candidate) - endpoint
#	3rd parameter (candidate) - function which is executed
#
app.add_url_rule('/api/candidate', 'candidate', candidate)


@app.route("/api/candidate/<string:id>", methods=["GET"])
def candidate_by_id(id):
	candidate = DATA_PROVIDER.get_candidate(id);
	if candidate:
		return jsonify({"candidate": candidate})
	else:
		#
		# In case we did not find the candidate by id
		# we send HTTP 404 - Not Found error to the client
		#
		abort(404)

		
		
# ROUTING:
#	This method updates the name of a Candidate, which was found by it's ID.
#	Please note the PUT HTTP verb in the methods list.
#
@app.route("/api/candidate/<string:id>/name/<string:new_name>", methods=["PUT"])
def update_name(id, new_name):
	nr_of_updated_items = DATA_PROVIDER.update_name(id, new_name)
	if nr_of_updated_items == 0:
		abort(404)
	else:
		return jsonify({"total_updated": nr_of_updated_items})
		
		

	
# ROUTING:
#	One method can handle multiple routes, like in this case
#	if there is no parameter after candidate, the method 
#	will default the nrOfItems to 1.
#
#	The <int:nrOfItems> is variable parameter and the int is a converter
#	which converts the the request parameter to an integer value.
#
@app.route("/api/random/candidate", defaults={"nrOfItems": 1}, methods=["GET"])
@app.route("/api/random/candidate/<int:nrOfItems>", methods=["GET"])
def random(nrOfItems):
	candidates = DATA_PROVIDER.get_random_candidates(nrOfItems)
	return jsonify({"candidates": candidates, "total": len(candidates)})

	
	
# ROUTING:
#	This is a method which deletes the candidate with the given id.
#	We use the DELETE HTTP verb for mapping this route.
#	
@app.route("/api/candidate/delete/<string:id>", methods=["DELETE"])
def delete(id):
	if(DATA_PROVIDER.delete_candidate(id)):
		return make_response('',200)
	else:
		return abort(404)

		
		

		
# ROUTING:
#	Here we use the HTTP POST verb and the Flask request object
#	to get the data which was sent from the client.
#	
#	Please note, that the response contains the ID of the newly
#	added Candidate and the URL through which this can be accessed.
#
@app.route("/api/candidate", methods=["POST"])
def add_candidate():
	first_name = request.form["first_name"]
	last_name = request.form["last_name"]
	
	new_candidate_id = DATA_PROVIDER.add_candidate(first_name, last_name)
	
	return jsonify({
		"id": new_candidate_id,
		"url": url_for("candidate_by_id", id=new_candidate_id)
	})
	
	
	
if __name__ == "__main__":
	app.run(debug=True)