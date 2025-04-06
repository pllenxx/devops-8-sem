FROM alpine:latest AS nginx-proxy

COPY --from=frontend /usr/share/nginx/html /usr/share/nginx/html

RUN apk update && \
    apk add --no-cache nginx && \
    adduser -D myuser && \
    chown -R myuser:myuser /var/lib/nginx /var/log/nginx /run/nginx

USER myuser

CMD ["nginx", "-g", "daemon off;"]