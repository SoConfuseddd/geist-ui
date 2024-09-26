pipeline { 
    agent any
    environment {
        PATH = "/usr/local/bin:$PATH" // Make sure to use the correct path to Yarn
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
        
        stage('Build') {
            steps {
                // Add your build steps here, e.g.:
                sh 'echo "Building the project..."'
                sh '/usr/local/node-v18.6.0/bin/yarn yarn'
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



// pipeline {
//     agent any

//     stages {
//         stage('Build') {
//             steps {
//                 sh 'echo "Building the project..."'
//             }
//         }

//         stage('Test') {
//             steps {
//                 sh 'echo "Running tests..."'
//             }
//         }

//         stage('Deploy') {
//             steps {
//                 sh 'echo "Deploying the project..."'
//             }
//         }
//     }
// }
