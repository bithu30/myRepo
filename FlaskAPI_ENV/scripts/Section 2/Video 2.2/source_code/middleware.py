from flask import jsonify
from flask import abort
from flask import make_response
from flask import request
from flask import url_for

from data_provider_service import DataProviderService

db_engine = 'mysql+mysqldb://packtuser:secret@localhost/packtwebapi?unix_socket=/opt/lampp/var/mysql/mysql.sock'


DATA_PROVIDER = DataProviderService(db_engine)


def candidate(serialize = True):
    candidates = DATA_PROVIDER.get_candidate(serialize=serialize)
    if serialize:
        return jsonify({"candidates": candidates, "total": len(candidates)})
    else:
        return candidates


def candidate_by_id(id):
    current_candidate = DATA_PROVIDER.get_candidate(id, serialize=True)
    if current_candidate:
        return jsonify({"candidate": current_candidate})
    else:
        #
        # In case we did not find the candidate by id
        # we send HTTP 404 - Not Found error to the client
        #
        abort(404)


def initialize_database():
    DATA_PROVIDER.init_database()


def fill_database():
    DATA_PROVIDER.fill_database()


def delete_candidate(id):
    if DATA_PROVIDER.delete_candidate(id):
        return make_response('', 200)
    else:
        return abort(404)


def update_candidate(id):
    new_candidate = {
        "first_name":request.form["first_name"],
        "last_name":request.form["last_name"],
        "email": request.form["email"],
        "phone": request.form["phone"]
    }
    updated_candidate = DATA_PROVIDER.update_candidate(id, new_candidate)
    if not updated_candidate:
        abort(404)
    else:
        return jsonify({"candidate": updated_candidate})


def random_candidates(nr_of_items):
    candidates = DATA_PROVIDER.get_random_candidates(nr_of_items)
    return jsonify({"candidates": candidates, "total": len(candidates)})


def random_projects(nr_of_items):
    projects = DATA_PROVIDER.get_random_projects(nr_of_items)
    return jsonify({"projects": projects, "total": len(projects)})


def add_project():
    project_name = request.form["name"]
    project_description = request.form["description"]

    new_project_id = DATA_PROVIDER.add_project(project_name, project_description)

    return jsonify({
        "id": new_project_id
    })


def add_candidate():
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    email = request.form["email"]
    phone = request.form["phone"]
    birthday = request.form["birthday"]

    new_candidate_id = DATA_PROVIDER.add_candidate(first_name=first_name,
                                                   last_name=last_name,
                                                   email=email,
                                                   birthday=birthday,
                                                   phone=phone)

    return jsonify({
        "id": new_candidate_id,
        "url": url_for("candidate_by_id", id=new_candidate_id)
    })


def build_message(key, message):
    return {key:message}
