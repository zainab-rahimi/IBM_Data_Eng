curl -X POST $CLOUDANTURL/movies/_index \
-H"Content-Type: application/json" \
-d'{
    "index": {
        "fields": ["Director"]
    }
}'



curl -X POST $CLOUDANTURL/movies/_find \
-H"Content-Type: application/json" \
-d'{ "selector":
        {
            "Director":"Richard Gage"
        }
    }'


curl -X POST $CLOUDANTURL/movies/_index \
-H"Content-Type: application/json" \
-d'{
    "index": {
        "fields": ["title"]
    }
}'


curl -X POST $CLOUDANTURL/movies/_find \
-H"Content-Type: application/json" \
-d'{ "selector":
        {
            "title":"Top Dog"
        },
        "fields" : ["year", "Director"]
    }'

MjUzOTEtenJhaGlt



mongoimport -u root -p MjUzOTEtenJhaGlt --authenticationDatabase admin --db entertainment --collection movies --file movies.json


## Mongodb
db.movies.aggregate([
  {
    "$group": {
        "_id": "$year",
        "sum_movies": {"$sum":1}
    }
  }
])

db.movies.find(
    {year: {$gt: 1999}}
).count()


db.movies.aggregate([
    {"$match": {year: 2007}},
    {
        $group: {
            _id: year,
            avg : {$avg: "$Votes"}
        }
    }
])


mongoexport -u root -p MjUzOTEtenJhaGlt \
--authenticationDatabase admin --db entertainment \
--collection movies --out partial_data.csv \ 
--type=csv --fields _id,title,year,rating,director

### Cassandra

COPY entertainment.movies(id,title,year,rating,Director) FROM 'partial_data.csv' WITH DELIMITER=',' AND HEADER=TRUE;

create index rating_index on movies (rating);

select count(title) as count_movies from movies where rating = 'G';