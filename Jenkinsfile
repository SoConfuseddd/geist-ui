pipeline {   
    agent any
    environment {
        PATH = "/usr/local/node-v18.6.0/bin/:/usr/bin/docker:$PATH" // Make sure to use the correct path to Yarn & Docker
        DOCKER_CREDENTIALS_ID = 'DockerHub' // Jenkins credentials ID for Docker Hub
        DOCKER_IMAGE_NAME = 'reactuilibrarytask/geist-ui'
    }
  
    triggers {
        githubPush() // Triggers the pipeline on a push event

    }

    stages {
        stage('Log Environment') {
            steps {
                sh 'echo $PATH' // Log the PATH environment variable
                sh 'yarn --version' // Check if yarn is available
            }
        }
        stage('Clone Repository') {
            steps {
                checkout scm // This checks out the latest changes from the repository
            }
        }
        
        stage('Installing Dependencies') {
            steps {
                // Add your build steps here, e.g.:
                sh 'echo "Building the project..."'
                sh 'yarn'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE_NAME}:${env.BUILD_ID} ."
            }
        }
        stage('Tag Images') {
            steps {
                script {
                    // Tag the current image as 'latest'
                    sh "docker tag ${DOCKER_IMAGE_NAME}:${env.BUILD_ID} ${DOCKER_IMAGE_NAME}:latest"
                }
            }
        }

        stage('Test') {
            steps {
                // Add test steps
                sh 'echo "Running tests..."'
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', "${env.DOCKER_CREDENTIALS_ID}") {
                        docker.image("${env.DOCKER_IMAGE_NAME}").push()
                    }
                }
            }
        }
        // stage('Login to Docker Hub') {
        //     steps {
        //         script {
        //             // Login to Docker Hub
        //             withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
        //                 sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
        //             }
        //         }
        //     }
        // }
        // stage('Push Docker Images') {
        //     steps {
        //         script {
        //             // Push the latest image
        //             sh "docker push ${DOCKER_IMAGE_NAME}:latest"

        //             // Push the current build image
        //             sh "docker push ${DOCKER_IMAGE_NAME}:${env.BUILD_ID}"
        //         }
        //     }
        // }
    }
    post {
        always {
            // Cleanup: Optionally, remove the built Docker image and tags
            sh "docker rmi -f ${DOCKER_IMAGE_NAME}:${env.BUILD_ID} ${DOCKER_IMAGE_NAME}:latest"
        }
    }
}
