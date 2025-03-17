FROM alpine:latest

ENV APP_HOME=/code
ENV NODE_ENV=production
ENV NODE_OPTIONS="--openssl-legacy-provider"

ENV PATH="$APP_HOME/node_modules/.bin:$PATH"

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR $APP_HOME

RUN apk add --no-cache nodejs npm

COPY ./code/django_web_front/package.json $APP_HOME/
RUN npm install --omit=dev && \
    npm cache clean --force

COPY ./code/django_web_front $APP_HOME/

RUN chown -R appuser:appgroup $APP_HOME
USER appuser

EXPOSE 3000

CMD ["npm", "start"]
ENTRYPOINT [ "sh", "./npm-install-and-start.sh" ]