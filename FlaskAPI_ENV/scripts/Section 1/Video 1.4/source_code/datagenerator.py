import random
import datetime

from candidate import Candidate
from project import Project
from experience import Experience


class DataGenerator:
    __first_names = ["Alene", "Alessandra", "Aleta", "Alethea", "Alex", "Alexa", "Alexandra",
                     "Deedee", "Deena", "Deerdre", "Deeyn", "Dehlia", "Deidre", "Deina", "John",
                     "Bob", "Jane", "Scott", "Duke", "Alison", "Jennifer", "Anastasia", "Greg", "Dom"]

    __last_names = ["Aaronson", "Ab", "Aba", "Abad", "Shoew", "Abagael", "Benil", "Benilda", "Benildas",
                    "Benildis", "White", "Red", "Green" "Carpenter", "Wittrock", "Black", "Bandidas", "Horseshoe",
                    "Lane", "Twain", "Kaine", "Foster"]

    __domains = ["IT", "Household", "Agriculture", "Health", "Insurance",
                 "Construction", "Transport", "Politics", "Human Resources", "Management", "Security",
                 "Banking", "Investment", "Racing", "Sports", "Coaching"]

    def __init__(self):
        pass

    def generate_candidates(self, nr):
        rnd_fn = self.generate_first_names(nr)
        rnd_ln = self.generate_last_names(nr)
        result = []

        for x in range(nr):
            experience = self.generate_experience(random.randint(1, 4), False)
            candidate = Candidate(rnd_fn[x], rnd_ln[x], experience)
            result.append(candidate)

        return [cand.serialize() for cand in result]

    def generate_names(self, nr):
        rnd_fn = self.generate_first_names(nr)
        rnd_ln = self.generate_last_names(nr)
        result = [{"first_name": rnd_fn[x], "last_name": rnd_ln[x]} for x in range(nr)]

        return result

    def generate_first_names(self, nr):
        fn_length = len(self.__first_names)
        result = [self.__first_names[random.randint(0, fn_length - 1)] for x in range(nr)]
        return result

    def generate_last_names(self, nr):
        ln_length = len(self.__last_names)
        result = [self.__last_names[random.randint(0, ln_length - 1)] for x in range(nr)]
        return result

    def generate_experience(self, nr, serialize=False):
        result = []

        for x in range(nr):
            domain = self.__domains[random.randint(0, len(self.__domains) - 1)]
            projects = self.generate_projects(random.randint(1, 5), False)
            exp = Experience(domain, random.randint(1, 15), projects)
            result.append(exp)

        if serialize:
            return [exp.serialize() for exp in result]
        else:
            return result

    def generate_projects(self, nr, serialize=False):
        result = []

        for x in range(nr):
            if random.randint(0, 1244) % 2 == 0:
                project_name = '[New] Project {0}'.format(self.__first_names[random.randint(0, len(self.__first_names) - 1)])
            else:
                project_name = "Project {0}".format(self.__last_names[random.randint(0, len(self.__last_names) - 1)])

            start_date = datetime.datetime(random.randint(1990, 2015), random.randint(1, 12), random.randint(1, 28))
            end_date = start_date + datetime.timedelta(days=random.randint(2, 432))
            prj = Project(project_name, start_date, end_date, 'Description for project {0}'.format(project_name))
            result.append(prj)

        if serialize:
            return [res.serialize() for res in result]
        else:
            return result
