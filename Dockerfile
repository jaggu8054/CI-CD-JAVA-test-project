FROM maven:3.9.11-eclipse-temurin-17-alpine AS  build 
RUN apk update && apk add git
RUN git  clone https://github.com/jaggu8054/CI-CD-JAVA-test-project.git
WORKDIR /CI-CD-JAVA-test-project
RUN mvn clean  package  -DskipTests=true 
RUN cp   target/my-first-project-for-test-1.0-SNAPSHOT.jar app.jar


FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /CI-CD-JAVA-test-project/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
