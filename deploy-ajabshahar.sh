#!/usr/bin/env bash

project_root="/projects/Ajab-Shahar-TW"
dropwizard_root="/opt/ajabshahar/"
web_root="/var/www"

pkill -9 -f platform-1.0-SNAPSHOT.jar

rm -f ${dropwizard_root}*
cp ${project_root}/target/platform-1.0-SNAPSHOT.jar ${dropwizard_root}
cp ${project_root}/development.yml ${dropwizard_root}

rm -rf ${web_root}/ajabshahar/*
cp -r ${project_root}/dist/ajabshahar.zip ${web_root}/ajabshahar/
cd ${web_root}/ajabshahar
unzip ajabshahar.zip
rm -f ajabshahar.zip

cd ${dropwizard_root}
java -jar platform-1.0-SNAPSHOT.jar db migrate development.yml
nohup java -jar platform-1.0-SNAPSHOT.jar server development.yml > /dev/null &
