pipeline {   
    agent any
    environment {
        PATH = "/usr/local/node-v18.6.0/bin/:/usr/bin/docker:$PATH" // Make sure to use the correct path to Yarn & Docker
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
                sh 'docker build .'
            }
        }

        stage('Test') {
            steps {
                // Add test steps
                sh 'echo "Running tests..."'
            }
        }
    }
}
