from flask import jsonify
from flask import render_template

from middleware import candidate_by_id
from middleware import candidate
from middleware import add_candidate
from middleware import candidate_update_name
from middleware import random_candidates
from middleware import delete_candidate
from middleware import random_projects
from middleware import add_project


def init_api_routes(app):
    if app:
        app.add_url_rule('/api/candidate/<string:id>', 'candidate_by_id', candidate_by_id, methods=['GET'])
        app.add_url_rule('/api/candidate', 'candidate', candidate, methods=['GET'])
        app.add_url_rule('/api/candidate', 'add_candidate', add_candidate, methods=['POST'])
        app.add_url_rule('/api/candidate/<string:id>/name/<string:new_name>', 'candidate_update_name',
                         candidate_update_name, methods=['PUT'])
        app.add_url_rule('/api/candidate/random', 'get_one_random_candidate', random_candidates,
                         methods=['GET'], defaults={'nr_of_items': 1})
        app.add_url_rule('/api/candidate/random/<int:nr_of_items>', 'get_random_candidates', random_candidates,
                         methods=['GET'])
        app.add_url_rule('/api/candidate/delete/<string:id>', 'delete_candidate', delete_candidate, methods=['DELETE'])
        app.add_url_rule('/api/project/random/<int:nr_of_items>', 'get_random_projects', random_projects,
                         methods=['GET'])
        app.add_url_rule('/api/project', 'add_project', add_project, methods=['POST'])
        app.add_url_rule('/api', 'list_routes', list_routes, methods=['GET'], defaults={'app': app})


def page_about():
    return render_template('about.html', selected_menu_item="about")


def page_project():
    return render_template('project.html', selected_menu_item="project")


def page_experience():
    return render_template('experience.html', selected_menu_item="experience")


def page_candidate():
    current_candidates = candidate(serialize=False)
    return render_template('candidate.html', selected_menu_item="candidate", candidates=current_candidates)


def page_index():
    return render_template('index.html', selected_menu_item="index")


def init_website_routes(app):
    if app:
        app.add_url_rule('/about', 'page_about', page_about, methods=['GET'])
        app.add_url_rule('/project', 'page_project', page_project, methods=['GET'])
        app.add_url_rule('/candidate', 'page_candidate', page_candidate, methods=['GET'])
        app.add_url_rule('/experience', 'page_experience', page_experience, methods=['GET'])
        app.add_url_rule('/', 'page_index', page_index, methods=['GET'])


def list_routes(app):
    result = []
    for rt in app.url_map.iter_rules():
        result.append({
            'methods': list(rt.methods),
            'route': str(rt)
        })
    return jsonify({'routes': result, 'total': len(result)})
