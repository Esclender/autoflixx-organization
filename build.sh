#!/bin/bash

# Function to build the project
build_jar() {
  local dir=$1
  cd $dir
  if [ -f "pom.xml" ]; then
    mvn clean package -DskipTests
    echo "Built JAR for $dir"
  else
    echo "No pom.xml found in $dir"
  fi
  cd ..
}

# Iterate through each subdirectory and build the project
for dir in */ ; do
  if [ -d "$dir" ]; then
    build_jar $dir
  fi
done

echo "All JAR files have been generated."