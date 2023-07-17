
#!/bin/bash

docker-compose up -d db
./wait-for 127.0.0.1:3336 -- docker-compose up -d