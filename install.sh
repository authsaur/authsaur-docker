#!/bin/bash

chmod +x wait-for
chmod +x start.sh
chmod +x stop.sh
chmod +x install.sh
chmod +x reset.sh

rm -rf dashboard/dist/
rm -rf dashboard/__MACOSX/
rm -rf admin
rm -rf server
rm -rf nginx/conf.d
rm -rf docker-compose.yml
rm -rf mysql

mkdir admin
mkdir server
mkdir mysql
mkdir mysql/conf
mkdir nginx/conf.d

AUTHSAUR_IP=`sed '/^AUTHSAUR_IP=/!d;s/.*=//' .env`
DB_PASSWORD=`sed '/^DB_PASSWORD=/!d;s/.*=//' .env`
DB_NAME=`sed '/^DB_NAME=/!d;s/.*=//' .env`
REDIS_PORT=`sed '/^REDIS_PORT=/!d;s/.*=//' .env`
REDIS_PASSWORD=`sed '/^REDIS_PASSWORD=/!d;s/.*=//' .env`
SSL=`sed '/^SSL=/!d;s/.*=//' .env`
AUTHSAUR_SERVER=$SSL://$AUTHSAUR_IP
AUTHSAUR_ADMIN=http://$AUTHSAUR_IP
CURRENT=`pwd`
echo $CURRENT
echo $AUTHSAUR_SERVER
echo $AUTHSAUR_ADMIN

sed -e 's!${CURRENT}!'"${CURRENT}"'!g' -e 's/${DB_PASSWORD}/'"${DB_PASSWORD}"'/g' -e 's/${DB_NAME}/'"${DB_NAME}"'/g' -e 's/${REDIS_PORT}/'"${REDIS_PORT}"'/g' -e 's/${REDIS_PASSWORD}/'"${REDIS_PASSWORD}"'/g' template/docker-compose-template.yml > docker-compose.yml
sed -e 's!${AUTHSAUR_SERVER}!'"${AUTHSAUR_SERVER}"'!g' -e 's/${AUTHSAUR_IP}/'"${AUTHSAUR_IP}"'/g' -e 's/${DB_PASSWORD}/'"${DB_PASSWORD}"'/g' -e 's/${DB_NAME}/'"${DB_NAME}"'/g' -e 's/${REDIS_PORT}/'"${REDIS_PORT}"'/g' -e 's/${REDIS_PASSWORD}/'"${REDIS_PASSWORD}"'/g' template/application.properties > admin/application.properties
sed -e 's!${AUTHSAUR_SERVER}!'"${AUTHSAUR_SERVER}"'!g' -e 's/${AUTHSAUR_IP}/'"${AUTHSAUR_IP}"'/g' -e 's/${DB_PASSWORD}/'"${DB_PASSWORD}"'/g' -e 's/${DB_NAME}/'"${DB_NAME}"'/g' -e 's/${REDIS_PORT}/'"${REDIS_PORT}"'/g' -e 's/${REDIS_PASSWORD}/'"${REDIS_PASSWORD}"'/g' template/cas.properties > server/cas.properties
cp template/authsaur.conf nginx/conf.d/authsaur.conf
sed -e 's!${AUTHSAUR_SERVER}!'"${AUTHSAUR_SERVER}"'!g' -e 's!${AUTHSAUR_ADMIN}!'"${AUTHSAUR_ADMIN}"'!g' template/init.sql > mysql/init.sql

if [ $SSL = 'http' ]
then
    cp template/server.conf nginx/conf.d/server.conf
else
    cp template/server_ssl.conf nginx/conf.d/server_ssl.conf
fi

cp template/my.cnf mysql/conf/my.cnf

unzip dashboard/dist.zip -d dashboard > /dev/null