FROM alpine:latest AS build

RUN apk update && \
    apk add --no-cache nodejs npm && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY ./package*.json ./

RUN npm install --no-cache

COPY ./public ./public
COPY ./src ./src

ENV REACT_APP_API_BASE_URL=http://localhost:8080

RUN npm run build

FROM alpine:latest

RUN apk add --no-cache nginx && \
    rm -rf /var/cache/apk/*

COPY --from=build /app/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]