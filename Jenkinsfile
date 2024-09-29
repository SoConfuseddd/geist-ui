pipeline {   
    agent any
    environment {
        PATH = "/usr/local/node-v18.6.0/bin/:/usr/bin/docker:$PATH"
        DOCKER_CREDENTIALS_ID = 'DockerHub'
        DOCKER_IMAGE_NAME = 'reactuilibrarytask/geist-ui'  
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Log Environment') {
            steps {
                sh 'echo $PATH'
                sh 'yarn --version'
            }
        }
        stage('Clean Up') {
            steps {
                sh 'docker system prune -af --volumes'
            }
        }
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Installing Dependencies') {
            steps {
                sh 'echo "Building the project..."'
                sh 'yarn'
            }
        }

        stage('Checking Code Style') {
            steps {
                sh 'echo "Linting the project code..."'
                sh 'yarn lint'
            }
        }

        stage('Testing') {
            steps {
                sh 'echo "Updating and Running Test Cases..."'
                sh 'yarn test:update --passWithNoTests' 
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
                    sh "docker tag ${DOCKER_IMAGE_NAME}:${env.BUILD_ID} ${DOCKER_IMAGE_NAME}:latest"
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
                    }
                }
            }
        }

        stage('Push Docker Images') {
            steps {
                script {
                    sh "docker push ${DOCKER_IMAGE_NAME}:${env.BUILD_ID}" 
                    sh "docker push ${DOCKER_IMAGE_NAME}:latest"
                }
            }
        }

        stage('Kubernetes Deploy') {
            agent { label 'KOPS' }
            steps {
                sh "kubectl get namespace prod || kubectl create namespace prod"
                sh "helm upgrade --install --force geist-ui-stack helm/geistuicharts --set appimage=${DOCKER_IMAGE_NAME}:latest --namespace prod"
            }
        }
    }

    post {
        always {
            sh "docker rmi -f ${DOCKER_IMAGE_NAME}:${env.BUILD_ID} ${DOCKER_IMAGE_NAME}:latest"
        }
    }
}
