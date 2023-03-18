FROM maven:3.9 as BUILDER

WORKDIR /app
COPY . .
RUN mvn clean install

FROM tomcat:8.0.51-jre8-alpine
WORKDIR /usr/local/tomcat/webapps
COPY --from=BUILDER /app/target/*.war .
CMD ["catalina.sh", "run"]