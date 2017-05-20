from sqlalchemy import Column, String, Integer, ForeignKey, Numeric, Date
from sqlalchemy.orm import relationship
from Model import Model
from pyld import jsonld

class Candidate(Model):
    __tablename__ = 'candidates'
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    first_name = Column(String(200), nullable=False)
    last_name = Column(String(200), nullable=False)
    email = Column(String(200), nullable=False)
    birthday = Column(Date, nullable=True)
    phone = Column(String(30), nullable=True)
    languages = Column(String(500), default="")
    skills = Column(String(1000), default="")
    interviews = relationship("Interview")
    reviews = relationship("Review")

    #
    # METHODS
    #

    def serialize(self):
        compacted_json = jsonld.compact({
            "http://schema.org/first_name": self.first_name,
            "http://schema.org/last_name": self.last_name,
            "http://schema.org/id": self.id,
            "http://schema.org/email": self.email,
            "http://schema.org/birthDate": self.birthday.isoformat() if self.birthday else "",
            "http://schema.org/telephone": self.phone,
            "http://schema.org/languages": self.languages,
            "http://schema.org/skills":self.skills,
            "http://schema.org/nr_of_reviews": len(self.reviews),
            "http://schema.org/nr_of_interviews": len(self.interviews)
        }, self.get_context())

        #print(compacted_json)

        return compacted_json


    def get_context(self):
        return {
            "@context": {
                "first_name": "http://schema.org/first_name",
                "last_name": "http://schema.org/last_name",
                "email": "http://schema.org/email",
                "birthday": "http://schema.org/birthDate",
                "phone": "http://schema.org/telephone",
                "languages": "http://schema.org/languages",
                "skills": "http://schema.org/skills",
                "nr_of_reviews": "http://schema.org/nr_of_reviews",
                "nr_of_interviews": "http://schema.org/nr_of_interviews",
                "id": "http://schema.org/id"
            }
        }
