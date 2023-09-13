# Jenkins Pipeline for Building and Pushing Docker Images

## Overview

This Jenkins pipeline automates the process of building a Maven-based Java application, creating a Docker image, and pushing it to Docker Hub. The pipeline is defined in the provided Jenkinsfile and consists of the following stages:

### 1. Git Checkout

- This stage checks out the source code from a GitHub repository's `main` branch.

### 2. Maven Build

- In this stage, the Java application is built using Maven. The `mvn clean package` command is executed to clean the project and package it as a WAR file.
- If the build is successful, the WAR artifacts are archived for later use.

### 3. Build Docker Image

- This stage builds a Docker image from the project files. The image name is generated dynamically based on the `DOCKER_IMAGE_NAME` and the Jenkins build number.

### 4. Push to Docker Hub

- In this stage, the built Docker image is pushed to Docker Hub. Docker Hub credentials are stored in a Jenkins credential named 'Docker'.

### 5. Post-build Cleanup

- After successfully pushing the Docker image to Docker Hub, this post-build stage removes the locally built Docker image to avoid cluttering the Jenkins server.

## Getting Started

Follow these steps to set up and run the Jenkins pipeline:

### Prerequisites

- Jenkins server with Docker installed and configured.
- Jenkins plugins for Git integration, Docker, and Maven.

### Installation

1. Clone this repository to your Jenkins server:

   ```bash
   git clone https://github.com/Shahid199578/Jenkins-Docker.git
   ```

2. Create a Jenkins pipeline job and configure it to use the provided Jenkinsfile.

3. Configure Jenkins to use Docker Hub credentials by creating a Jenkins credential named 'Docker' with your Docker Hub username and password/token.

4. Adjust the `DOCKER_IMAGE_NAME` variable in the Jenkinsfile to match your desired Docker image name.

## Usage

1. Trigger the Jenkins pipeline manually or set up a webhook for automatic builds.

2. The pipeline will automatically:
   - Check out the source code from your GitHub repository.
   - Build the Java application using Maven.
   - Create a Docker image from the application.
   - Push the Docker image to Docker Hub.

3. After the pipeline completes successfully, you can access your Docker image on Docker Hub.


## Acknowledgments

We would like to acknowledge the following third-party tools and services that are integral to the functioning of this Jenkins pipeline:

- **Jenkins:** Our continuous integration and continuous deployment (CI/CD) platform, which orchestrates and automates the entire build and deployment process.

- **Maven:** The build automation tool that simplifies the building of Java applications and manages project dependencies efficiently.

- **Docker:** The containerization platform used to create lightweight and consistent environments for our applications.

- **Docker Hub:** The cloud-based container registry where we store and share our Docker images.

- **GitHub:** Our source code repository hosting service, which provides version control and collaboration features for our project.

- **Git:** The distributed version control system that allows us to track changes in our source code and collaborate seamlessly.

We are grateful for the contributions of these tools and services in streamlining our development and deployment workflows.


## Contact

If you have any questions or need assistance, feel free to contact [Mohd Shahid](mailto:shahid199578@gmail.com).
```
