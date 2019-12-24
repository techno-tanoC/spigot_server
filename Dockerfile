FROM openjdk:8-jre-alpine as builder

ARG spigot_version

WORKDIR /build

COPY BuildTools.jar .
RUN apk add --no-cache openjdk8-jre git && \
    java -jar BuildTools.jar --rev ${spigot_version} && \
    mv spigot-${spigot_version}.jar spigot.jar


FROM openjdk:8-jre-alpine

WORKDIR /temp
COPY --from=builder /build/spigot.jar /app/spigot.jar
RUN java -Xms1G -Xmx1G -jar /app/spigot.jar nogui

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

