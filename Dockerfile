FROM alpine:latest

RUN apk add --no-cache nginx && \
    id nginx || adduser -S nginx && \
    mkdir -p /var/www/html /etc/nginx/conf.d && \
    chown -R nginx:nginx /var/www/html /etc/nginx/conf.d /var/lib/nginx /var/log/nginx

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

USER nginx

CMD ["nginx", "-g", "daemon off;"]