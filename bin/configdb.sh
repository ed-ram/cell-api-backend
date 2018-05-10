#!/bin/bash

echo "configuring db..."

/usr/bin/dropdb cellapi
/usr/bin/createdb cellapidb

psql cellapidb < ./bin/sql/cell.sql

echo "db configured"