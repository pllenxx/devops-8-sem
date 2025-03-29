FROM build AS run

ENV APP_HOME=/code
WORKDIR $APP_HOME

COPY --from=build $APP_HOME $APP_HOME

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup $APP_HOME

USER appuser

EXPOSE 3000 8000

CMD ["sh", "./npm-install-and-start.sh"]
