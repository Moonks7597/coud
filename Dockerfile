FROM openjdk:11-jdk AS builder
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src
RUN chmod +x ./gradlew
RUN ./gradlew bootJar
RUN apt-get update; apt-get install -y fontconfig libfreetype6

FROM openjdk:11-jre-buster
EXPOSE 80
EXPOSE 443
COPY --from=builder build/libs/coud-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java", "-Dspring.profiles.active=${SRPING_PROFILES_ACTIVE}","-Dlog4j2.formatMsgNoLookups=true", "-jar", "/app/coud-0.0.1-SNAPSHOT.jar"]
