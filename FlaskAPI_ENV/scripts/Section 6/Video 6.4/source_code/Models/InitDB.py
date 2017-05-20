from sqlalchemy import create_engine
from Model import Model


def init_database(engine):
    db_engine = create_engine(engine, echo=True)
    Model.metadata.create_all(db_engine)

