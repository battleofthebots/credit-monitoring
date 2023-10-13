FROM maven:3-jdk-8 as builder

WORKDIR /opt/
ADD ./pom.xml ./
ADD ./src ./src

RUN mvn package
# Target will end up in /opt/target/struts-1.0.0.jar