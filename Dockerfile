FROM maven:3.8.4-openjdk-17 AS build
COPY . . 
RUN mvn clean package -Dskiptests 

FROM openjdk:17-jdk-slim
COPY --from=build /target/Ubudehe-App-0.0.1-SNAPSHOT.jar Ubudehe-App.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","Ubudehe-App.jar" ]