from flask import jsonify
from flask import abort
from flask import make_response
from flask import request
from flask import url_for

from data_provider_service import DataProviderService

DATA_PROVIDER = DataProviderService(15)


def candidate(serialize = True):
    candidates = DATA_PROVIDER.get_candidates()
    if serialize:
        return jsonify({"candidates": candidates, "total": len(candidates)})
    else:
        return candidates


def candidate_by_id(id):
    current_candidate = DATA_PROVIDER.get_candidate(id)
    if current_candidate:
        return jsonify({"candidate": current_candidate})
    else:
        #
        # In case we did not find the candidate by id
        # we send HTTP 404 - Not Found error to the client
        #
        abort(404)


def delete_candidate(id):
    if DATA_PROVIDER.delete_candidate(id):
        return make_response('', 200)
    else:
        return abort(404)


def candidate_update_name(id, new_name):
    nr_of_updated_items = DATA_PROVIDER.update_name(id, new_name)
    if nr_of_updated_items == 0:
        abort(404)
    else:
        return jsonify({"total_updated": nr_of_updated_items})


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

    new_candidate_id = DATA_PROVIDER.add_candidate(first_name, last_name)

    return jsonify({
        "id": new_candidate_id,
        "url": url_for("candidate_by_id", id=new_candidate_id)
    })