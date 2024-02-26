from pymongo import MongoClient

mongo_connect = MongoClient("mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.1.5")


db = mongo_connect.training

collection = db.python 

doc = {"lab": "accessing mongodb using python", 
       "subject": "introduction to NoSQL"}


db.collection.insert_one(doc)


docs = db.collection.find()

for document in docs:
    print (document)

print("closing the connestion")
mongo_connect.close()