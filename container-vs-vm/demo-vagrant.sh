#!/bin/bash

#----------
# start MongoDB VMs: "db1" & "db2"
#----------
 
vagrant up

# check if they're really up
vagrant status


#----------
# check if MongoDB servers are really up
#----------

# Step 0: "mongod" process visible on host OS?
ps aux | grep mongod


# Step 1: check db1 (port 27017)
mongo --port 27017
db.stats()
db.memo.insert({ "name": "db1" })
db.stats()
exit

# Step 2: check db2 (port 27018)
mongo --port 27018
db.stats()
db.memo.insert({ "name": "db2" })
db.stats()
exit


#
# ssh into
#

vagrant ssh db1

