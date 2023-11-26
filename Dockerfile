FROM maven:3.6.3-openjdk-17 AS build
COPY . . 
RUN mvn clean package -Dskiptests 

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/Ubudehe-System-App-0.0.1-SNAPSHOT.jar Ubudehe-System-App.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","Ubudehe-System-App.jar" ]