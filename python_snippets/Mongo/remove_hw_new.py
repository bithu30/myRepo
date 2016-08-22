import pymongo
from pymongo import MongoClient

conn = MongoClient('localhost')

db = conn.school

students = db.students
hw_score_dict={}
for rec in students.aggregate([
    {"$unwind":"$scores"},
    {"$match": {"scores.type": "homework"}}

]):
    #print rec['_id']

    #print rec['scores']['score']

    if hw_score_dict.has_key(rec['_id']):
        hw_score_dict[rec['_id']].append(rec['scores']['score'])
    else:
        hw_score_dict[rec['_id']] = []
        hw_score_dict[rec['_id']].append(rec['scores']['score'])

#print dir(students)

for (id,score_list) in hw_score_dict.items():
    print id
    print score_list
    min_score= min(score_list)
    print min_score
    students.update(
        {"_id": id},
        {"$pull":
             {"scores": { "type":"homework","score":min_score} }
        }
    )
    #result = students.delete_one({ "_id":id,"scores.type":"homework","scores.score":min_score })
    #print result.deleted_count




