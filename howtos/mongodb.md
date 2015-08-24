Mongodb
====
```
from pymongo import MongoClient
c = MongoClient()
c.database_names()

db = c['test_database’]
db.collection_names()

posts = db.posts

post = {"company":"NY Times","webpage":"http://nytimes.com"}
post_id = posts.insert(post)

posts.find_one()
for i in posts.find() #iterate
db.collection_names() #names of 'collections'/tables inside a DB
client.database_names() #names of 'databases'

#deleting
c.drop_database('mydatabase')
c['mydatabase'].drop_collection('mycollection')

#remove an entry
posts.remove(i)

#collection is like SQL tables
db.collection_names()

#update posts that exist
for i in posts.find():
     i["last_name"] = "test"
     posts.save(i)
```

In shell:
```
mongodump -d my_db -o dump
mongorestore -d my_db dump/my_db
```

Speed up queries:
```
db.posts.ensure_index('<key_name>')
#use an $in instead of an $or, e.g.,
db.posts.find({'key':{'$in':list_of_values}}) where list_of_values = [<value>,<value, …]
```

Running mongod with --REST option:
```
vim /etc/mongodb.conf and change nohttpinterface
mongod --rest --config /etc/mongodb.conf
```

Setup Mongodb Server
```
sudo apt-get install mongodb
sudo vi /etc/mongodb.conf
> bind_ip = 0.0.0.0
> auth = true
mongo
use admin
db.addUser("admin", “your_passwd”)  #admin needs to exist to disable localhost rule/access
#now can access at mongoldb://admin:your_passwd@server:port
```