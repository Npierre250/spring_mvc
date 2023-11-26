FROM maven:3.8.4-openjdk-17 AS build
COPY . . 
RUN mvn clean package -Dskiptests 

FROM openjdk:17-jdk-slim
COPY --from=build /target/UbudeheSystemApp-0.0.1-SNAPSHOT.jar UbudeheSystemApp.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","UbudeheSystemApp.jar" ]