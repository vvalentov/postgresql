#!/bin/sh

PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

PGPASSWORD=pass
export PGPASSWORD
pathB=/home/user/backup_bd
dbUser=user
database=base
host=192.168.1.1
port=5432


find $pathB \( -name "*-1[^5].*" -o -name "*-[023]?.*" \) -ctime +30 -delete
pg_dump -h $host --port $port  -U $dbUser $database | gzip > $pathB/$database_$(date "+%Y-%m-%d").sql.gz


unset PGPASSWORD
