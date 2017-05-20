import hashlib
import json

from flask import jsonify
from flask import abort
from flask import make_response
from flask import request
from flask import url_for

from math import ceil

from data_provider_service import DataProviderService

db_engine = 'mysql+mysqldb://packtuser:secret@localhost/packtwebapi?unix_socket=/opt/lampp/var/mysql/mysql.sock'

PAGE_SIZE = 2

DATA_PROVIDER = DataProviderService(db_engine)


def candidate(serialize = True):
    candidates = DATA_PROVIDER.get_candidate(serialize=True)
    page = request.args.get("page")

    if page:
        nr_of_pages = int(ceil(float(len(candidates)) / PAGE_SIZE))
        converted_page = int(page)
        if converted_page > nr_of_pages or converted_page < 0:
            return make_response("", 404)

        from_idx = converted_page * PAGE_SIZE - 1
        stop_idx = from_idx + PAGE_SIZE

        candidates = candidates[from_idx:stop_idx]

    if serialize:
        data = {"candidates": candidates, "total": len(candidates)}
        json_data = json.dumps(data)
        response = make_response(jsonify(data), 200)
        response.headers["ETag"] = str(hashlib.sha256(json_data).hexdigest())
        response.headers["Cache-Control"] = "private, max-age=300"
        return response
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
    try:
        if DATA_PROVIDER.delete_candidate(id):
            return make_response("", 200)
        else:
            return make_response("", 404)
    except ValueError as err:
        tmp_response = make_response("", 500)
        tmp_response.headers["X-APP-ERROR-CODE"] = get_error_code(err)
        tmp_response.headers["X-APP-ERROR-MESSAGE"] = err.message
        return tmp_response


def get_error_code(error):
    if "parameter" in error.message.lower():
        return 9100

    return 9000

def update_candidate(id):
    new_candidate = {
        "first_name":request.form["first_name"],
        "last_name":request.form["last_name"],
        "email": request.form["email"],
        "phone": request.form["phone"]
    }
    updated_candidate = DATA_PROVIDER.update_candidate(id, new_candidate)
    if not updated_candidate:
        return make_response('', 404)
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

    new_candidate_id = DATA_PROVIDER.add_candidate(first_name=first_name,
                                                   last_name=last_name,
                                                   email=email,
                                                   phone=phone)

    return jsonify({
        "id": new_candidate_id,
        "url": url_for("candidate_by_id", id=new_candidate_id)
    })


def build_message(key, message):
    return {key:message}
