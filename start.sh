#!/bin/bash

# Function to run the Spring Boot application
run_spring_boot() {
  local dir=$1
  cd $dir
  if [ -f "pom.xml" ]; then
    mvn spring-boot:run &
    echo "Started Spring Boot application in $dir"
  else
    echo "No pom.xml found in $dir"
  fi
  cd ..
}

# List of service directories
services=("eurekaserver" "config-server" "movies-services" "api-gateway")

# Iterate through each service directory and run the Spring Boot application
for service in "${services[@]}"; do
  if [ -d "$service" ]; then
    run_spring_boot $service
  else
    echo "Directory $service does not exist"
  fi
done

echo "All Spring Boot applications have been started."