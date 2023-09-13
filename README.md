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
   - After successfully pushing the image, the pipeline logs out from Docker Hub.

### 5. Post-build Cleanup

- After successfully pushing the Docker image to Docker Hub, this post-build stage removes the locally built Docker image to avoid cluttering the Jenkins server.



## Jenkins Environment Variables

The pipeline uses environment variables to configure and customize the build and deployment process. Here's how to create and configure environment variables in Jenkins:

## Environment Variables
The pipeline uses several environment variables to configure and customize the build and deployment process:

- `DOCKER_HUB_CREDENTIALS`: This variable is set to the name of a Jenkins credential named 'Docker'. It's used for authentication when pushing the Docker image to Docker Hub.

- `DOCKER_IMAGE_NAME`: This variable represents the full name and tag of the Docker image. It's constructed using the global variable `${MY_REPO}` (which is your Docker Hub username) and the Jenkins job name converted to lowercase. For example, if `${MY_REPO}` is set to 'dockerhub_username' and your Jenkins job is named 'MyApp', the `DOCKER_IMAGE_NAME` will be 'dockerhub_username/myapp:42', where '42' is the Jenkins build number.
Please ensure you have configured the Jenkins global variable ${MY_REPO} with your Docker Hub username as per your setup.

### Creating Jenkins global variable

1. **Log in to Jenkins:** Open your Jenkins instance in a web browser and log in.

2. **Accessing Global Configuration:** Click on "Manage Jenkins" in the Jenkins dashboard.

3. **Configure System:** Choose "Configure System" from the list of options.

4. **Adding Environment Variables:**
   - Scroll down to the "Global properties" section.
   - Check the box for "Environment variables."
   - Click the "Add" button to add a new environment variable.
   - Provide a name for the variable (e.g., `MY_REPO`) and its corresponding value (e.g., `dockerhub_username`).
   - Click "Save" to save your changes.

### Referencing Environment Variables in the Pipeline

In your Jenkins pipeline script (`Jenkinsfile`), you can reference the environment variables as follows:

```groovy
environment {
        DOCKER_HUB_CREDENTIALS = 'Docker'
        DOCKER_IMAGE_NAME = "${MY_REPO}/${env.JOB_NAME.toLowerCase()}:${BUILD_NUMBER}"  // ${MY_REPO}` (which is your Docker Hub username) and the Jenkins job name converted to lowercase
    }
```

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



- This 'README.md' file provides an overview and detailed steps for the Jenkins pipeline, helping users understand its purpose and how to set it up. You can replace the placeholders with your specific project details.

