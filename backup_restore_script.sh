file="$1"
psql -U postgres -c 'drop database if exists "platform-dev" ';
psql -U postgres -c 'create database "platform-dev"';
psql -U postgres -c 'grant all privileges on database "platform-dev" to "pg-dev"';
psql "platform-dev" -U postgres < "$file"