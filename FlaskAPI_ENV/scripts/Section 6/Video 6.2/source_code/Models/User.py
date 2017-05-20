from sqlalchemy import Column, String, Integer, ForeignKey, Numeric, Date
from sqlalchemy.orm import relationship
from Model import Model

class User(Model):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    user_name = Column(String(200))
    first_name = Column(String(400))
    last_name = Column(String(400))
    password = Column(String(2000))