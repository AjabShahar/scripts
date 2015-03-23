#!/usr/bin/env bash

project_root="/projects/Ajab-Shahar-TW"
dropwizard_root="/opt/ajabshahar/"
web_root="/var/www"

rm -rf ${web_root}/ajabshahar/*
cp -r ${project_root}/dist/ajabshahar.zip ${web_root}/ajabshahar/
cd ${web_root}/ajabshahar
unzip ajabshahar.zip
rm -f ajabshahar.zip
