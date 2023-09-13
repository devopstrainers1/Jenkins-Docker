pipeline {
    agent any
    
    tools {
        
        maven 'Maven-Tool'
        
    }

    environment {
        DOCKER_HUB_CREDENTIALS = 'Docker'
        DOCKER_IMAGE_NAME = "${MY_REPO}/${env.JOB_NAME.toLowerCase()}:${BUILD_NUMBER}"  // ${MY_REPO}` (which is your Docker Hub username) and the Jenkins job name converted to lowercase
    }

    stages {
        stage('Git Checkout') {
            steps {
                // Checkout the Dockerfile and any other necessary files from your repository
                git branch: 'main', credentialsId: '', url: 'https://github.com/Shahid199578/Jenkins-Docker.git'
            }
        }
        stage ('Maven Build') {
            
            steps {
                
                sh 'mvn clean package'
                
            }
            
            post {
                
                success {
                    
                    archiveArtifacts artifacts: '*/**.war'
                    
                }
            
            }
        
        }
        
        stage('Build docker image') {
            steps {        
                // Build the Docker image
                script {
                    docker.build("${DOCKER_IMAGE_NAME}", ".")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Log in to Docker Hub using the provided credentials
                script {
                    docker.withRegistry('', "${DOCKER_HUB_CREDENTIALS}") {
                        // Push the built image to Docker Hub
                        docker.image("${DOCKER_IMAGE_NAME}").push()
                    }
                }
            }
            post {
                always {
                // Logout from Docker Hub
                     script {
                        sh "docker logout"
                     }
                }
            }
            
        }
    }
    
    post {
        always {
            // Clean up - remove the built Docker image locally
            script {
                // Remove the Docker image using the 'sh' step
                sh "docker rmi -f ${DOCKER_IMAGE_NAME}"
            }
        }
    }
}
