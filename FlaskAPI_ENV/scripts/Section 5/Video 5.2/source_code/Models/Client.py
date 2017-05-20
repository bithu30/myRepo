from sqlalchemy import Column, String, Integer, ForeignKey, Numeric, Date
from sqlalchemy.orm import relationship
from Model import Model

class Client(Model):
    __tablename__ = 'clients'
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    name = Column(String(200))
    phone = Column(String(30))
    email = Column(String(200))
    positions = relationship("Position")