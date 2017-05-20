from sqlalchemy import Column, String, Integer, ForeignKey, Numeric, Date
from sqlalchemy.orm import relationship
from Model import Model

class Interview(Model):
    __tablename__ = 'interviews'
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    date = Column(Date)
    feedback = Column(String(2000))

    #
    # Reference for the position
    #
    position = Column(Integer, ForeignKey('positions.id'))

    #
    # Reference for the recruiter_1
    #
    recruiter_id = Column(Integer, ForeignKey('recruiters.id'))
    recruiter = relationship("Recruiter")

    #
    # Reference for the candidate
    #
    candidate = Column(Integer, ForeignKey('candidates.id'))