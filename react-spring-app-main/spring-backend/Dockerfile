FROM alpine:latest AS build

RUN apk update && \
    apk add --no-cache openjdk17 maven && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY ./pom.xml ./

RUN mvn dependency:copy-dependencies

COPY ./src ./src

RUN mvn package

FROM alpine:latest as backend

RUN apk update && \
    apk add --no-cache openjdk17-jre && \
    rm -rf /var/cache/apk/*

COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]