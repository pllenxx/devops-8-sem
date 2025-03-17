#!/bin/bash
set -e

if [ ! -s "$PGDATA/PG_VERSION" ]; then
    echo "Init PostgreSQL database"
	initdb --username="$POSTGRES_USER" --pwfile=<(echo "$POSTGRES_PASSWORD")

    echo "host all all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"
    echo "listen_addresses='*'" >> "$PGDATA/postgresql.conf"
    pg_ctl start

    if [ "$POSTGRES_DB" ]; then
        createdb --username="$POSTGRES_USER" "$POSTGRES_DB"
    fi

    if [ "$POSTGRES_USER" ] && [ "$POSTGRES_PASSWORD" ]; then
        psql --username="$POSTGRES_USER" --dbname="$POSTGRES_DB" --command "ALTER USER \"$POSTGRES_USER\" WITH PASSWORD '$POSTGRES_PASSWORD';"
    fi
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE test_app;
	GRANT ALL PRIVILEGES ON DATABASE test_app TO $POSTGRES_USER;
	EOSQL

    pg_ctl stop
fi

exec postgres