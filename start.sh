
#!/bin/bash

docker-compose up -d db
./wait-for 127.0.0.1:3306 -- docker-compose up -d