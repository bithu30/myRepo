from candidate import Candidate
from project import Project
from experience import Experience
from datagenerator import DataGenerator

import datetime


class DataProviderService:
    def __init__(self, nr_of_items):
        self.data_generator = DataGenerator()
        self.CANDIDATES = self.data_generator.generate_candidates(nr_of_items)

    def get_candidates(self):
        return self.CANDIDATES

    def get_candidate(self, id):
        result = None
        if id:
            for cand in self.CANDIDATES:
                if id == str(cand["id"]):
                    result = cand
                    break

        return result

    def get_random_candidates(self, nr_of_candidates):
        return self.data_generator.generate_candidates(nr_of_candidates)

    def update_name(self, id, new_name):
        nr_of_updated_items = 0

        for cand in self.CANDIDATES:
            if id == str(cand["id"]):
                cand["first_name"] = new_name
                nr_of_updated_items += 1
                break

        return nr_of_updated_items

    def delete_candidate(self, id):
        cand_for_delete = None
        for cand in self.CANDIDATES:
            if id == str(cand["id"]):
                cand_for_delete = cand
                break

        if cand_for_delete is not None:
            self.CANDIDATES.remove(cand_for_delete)
            return True
        else:
            return False

    def add_candidate(self, first_name, last_name):
        cand = Candidate(first_name, last_name, [])
        self.CANDIDATES.append(cand.serialize())
        return str(cand.id)

    def add_project(self, project_name, project_description):
        new_project = Project(project_name, datetime.datetime.utcnow(), datetime.datetime.utcnow(), project_description)

        self.CANDIDATES[0]['experience'][0]['projects'].append(new_project.serialize())
        return str(new_project.id)


    def get_random_projects(self, nr_of_projects):
        return self.data_generator.generate_projects(nr_of_projects, True)
