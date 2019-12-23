FROM openjdk:8-jre-alpine as builder

ARG spigot_version

WORKDIR /build

COPY BuildTools.jar /build/BuildTools.jar
RUN apk add --no-cache openjdk8-jre git
RUN java -jar BuildTools.jar --rev ${spigot_version}
RUN mv spigot-${spigot_version}.jar spigot.jar


FROM openjdk:8-jre-alpine

RUN apk add --no-cache openjdk8-jre

WORKDIR /app
COPY --from=builder /build/spigot.jar /app/spigot.jar
RUN java -Xms1G -Xmx1G -jar spigot.jar nogui
COPY start.sh start.sh
RUN chmod +x start.sh

