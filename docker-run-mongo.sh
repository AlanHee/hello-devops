#!/bin/bash

#docker run -it mongo:3.2 mongo
docker run -p 27017:27017 -v $PWD/db:/data/db -d mongo:3.2
#docker run -it mongo:3.2 mongo --host 172.17.0.1
