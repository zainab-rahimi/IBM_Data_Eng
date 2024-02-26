from pymongo import MongoClient



print("connecting to server")

connect = MongoClient("localhost", 27017)

print("Getting list of databases")
dbs = connect.list_database_names()

for db in dbs:
    print (db)


print("Closing the connection")
connect.close()
