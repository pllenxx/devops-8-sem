FROM alpine:latest AS build

ENV APP_HOME=/code
WORKDIR $APP_HOME

RUN apk add --no-cache nodejs npm

COPY ./code/django_web_front/package.json $APP_HOME/
RUN npm install --omit=dev && \
    npm cache clean --force

COPY ./code/django_web_front $APP_HOME/

FROM alpine:latest

ENV APP_HOME=/code
WORKDIR $APP_HOME

RUN apk add --no-cache nodejs npm

COPY --from=build $APP_HOME $APP_HOME

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup $APP_HOME

USER appuser

EXPOSE 3000

CMD ["npm", "start"]
ENTRYPOINT [ "sh", "./npm-install-and-start.sh" ]