FROM alpine:latest


# RUN apk add openrc && apk add postgresql15 postgresql15-contrib postgresql15-openrc && rc-update add postgresql
# RUN apk add sudo

# RUN echo 'local       all       all       trust' >  /etc/postgresql15/pg_hba.conf
# RUN apk add openrc && rc-service postgresql restart

RUN apk add --no-cache postgresql postgresql-contrib

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=test_app
ENV PGDATA=/var/lib/postgresql/data


COPY ./code/django_db/init-user-db.sh run-postgresql.sh
RUN chmod +x run-postgresql.sh
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA"
RUN mkdir -p /run/postgresql && chown -R postgres:postgres /run/postgresql
USER postgres
ENTRYPOINT [ "sh", "./run-postgresql.sh" ]

EXPOSE 5432

CMD ["postgres"]