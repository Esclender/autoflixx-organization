# Use an OpenJDK image
FROM openjdk:21-jdk-slim

# Copy the built jar into the container
ARG JAR_FILE=target/api-gateway-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

# Expose the port the service runs on
EXPOSE 9090

# Run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]
