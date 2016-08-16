import pymongo
from pymongo import MongoClient

conn = MongoClient('localhost')

db = conn.students

grades = db.grades

prev_sid = 0
prev_score = 0
prev_id = 0
lowest_hw_grades = {}
for rec in grades.find({"type":"homework"}).sort("score",pymongo.ASCENDING).sort("student_id"):
     s_id = rec["student_id"]
     #print s_id
     score = rec["score"]
     #print score
     id = rec['_id']

     if ( prev_sid == 0 and prev_score == 0 and prev_id == 0):
         prev_sid = s_id
         prev_score = score
         prev_id = id
     elif ( prev_sid == s_id and score < prev_score ):
         lowest_hw_grades[s_id] = [score,id]
     elif ( prev_sid == s_id and score > prev_score ):
         lowest_hw_grades[s_id] = [prev_score,prev_id]
     else:
         prev_sid=s_id
         prev_score =score
         prev_id = id

for ( s_id,detail_list) in lowest_hw_grades.items():

    print "student_id:",s_id , "details",detail_list
    id = detail_list[1]
    grades.remove({"_id":id})


