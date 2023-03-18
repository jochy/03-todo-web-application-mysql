FROM maven:3.9 as BUILDER

WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:11-jre
WORKDIR /
COPY --from=BUILDER /app/target/*.jar .
CMD ["java", "-jar", "todo-web-application-mysql.jar"]