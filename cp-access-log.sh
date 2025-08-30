#!/usr/bin/bash

#download file
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz

#unzip file
gunzip -f web-server-access-log.txt.gz

#select first 4 columns separated by hash, change it to comma and save into csv
cut -d"#" -f1-4 web-server-access-log.txt | tr "#" "," > access_log.csv

export PGPASSWORD=W3VbOqLARBFtOx7hUEyhRaxX;

echo "\c template1; \COPY access_log FROM '/home/project/access_log.csv' DELIMITERS ',' CSV HEADER;" | psql --host 172.21.39.201 -p 5432 -U postgres

echo "select * from access_log" | psql --host 172.21.39.201 -p 5432 -U postgres template1
