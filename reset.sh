#!/bin/bash

docker-compose down

rm -rf dashboard/dist/
rm -rf admin/application.properties
rm -rf server/cas.properties
rm -rf nginx/conf.d/authsaur.conf
rm -rf nginx/conf.d/server.conf
rm -rf nginx/conf.d/server_ssl.conf
rm -rf docker-compose.yml
rm -rf mysql/init.sql

rm -rf redis/data redis/logs
rm -rf mysql/data mysql/log mysql/conf
