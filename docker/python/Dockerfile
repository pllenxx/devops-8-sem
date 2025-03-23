FROM alpine:latest AS build

ENV APP_HOME=/code
WORKDIR $APP_HOME

RUN apk add --no-cache python3 py3-pip py3-setuptools python3-dev \
    && apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev libpq build-base

COPY ./code/django_rest_api $APP_HOME/

RUN python3 -m venv $APP_HOME/venv

RUN source $APP_HOME/venv/bin/activate && pip install --no-cache-dir -r requirements.txt

FROM alpine:latest

ENV APP_HOME=/code
ENV PATH="$APP_HOME/bin:$PATH"

WORKDIR $APP_HOME

RUN apk add --no-cache python3 py3-pip py3-setuptools libpq

COPY --from=build $APP_HOME $APP_HOME

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup $APP_HOME

USER appuser

EXPOSE 8000

ENTRYPOINT [ "sh", "./run-migrate-and-server.sh" ]