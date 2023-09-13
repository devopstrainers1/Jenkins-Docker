# Use the maven image as the build environment to generate the .war file
FROM maven:3.8.3-jdk-11 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Download the project dependencies
RUN mvn dependency:go-offline

# Copy the source code to the container
COPY src/ ./src/

# Build the project and generate the .war file
RUN mvn package

# Use the official Tomcat base image for the production container
FROM tomcat:latest

# Maintainer information
LABEL maintainer="Your Name <your.email@example.com>"

# Remove the default Tomcat sample applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your token generation system (WAR file) from the builder stage to the Tomcat webapps directory
COPY --from=builder /app/target/your_token_generation_system.war /usr/local/tomcat/webapps/

# (Optional) If your token generation system requires additional configurations or dependencies,
# you can copy them into the Tomcat container as well. For example:
# COPY config.properties /usr/local/tomcat/conf/

# Expose the default Tomcat port (8080) for accessing your token generation system
EXPOSE 8080

# Start the Tomcat server when the container runs
CMD ["catalina.sh", "run"]
