from sqlalchemy import Column, String, Integer, ForeignKey, Numeric, Date
from sqlalchemy.orm import relationship
from Model import Model

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
        return {
            "first_name": self.first_name,
            "last_name": self.last_name,
            "id": self.id,
            "email": self.email,
            "birthday": self.birthday.isoformat() if self.birthday else "",
            "phone": self.phone,
            "languages": self.languages,
            "skills":self.skills,
            "nr_of_reviews": len(self.reviews),
            "nr_of_interviews": len(self.interviews)
        }
