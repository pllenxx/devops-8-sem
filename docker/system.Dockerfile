FROM alpine:latest AS system

RUN apk add --no-cache nodejs npm python3 py3-pip
