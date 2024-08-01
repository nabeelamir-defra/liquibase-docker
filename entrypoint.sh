#!/bin/sh

if [ "$DATABASE_HOST" = "localhost" ]; then \
  export DATABASE_HOST='host.docker.internal'; \
fi

export FULL_URL="jdbc:postgresql://$DATABASE_HOST:$DATABASE_PORT/rcr_api"
echo "Full URL=$FULL_URL"

liquibase \
    --url=$FULL_URL \
    --username=$DATABASE_USERNAME \
    --password=$DATABASE_PASSWORD \
    --defaultSchemaName=public \
    --changeLogFile=db/changelog/db.changelog-master.xml \
    $ACTION
