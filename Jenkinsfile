pipeline {
    agent any
 
    triggers {
        githubPush() // Triggers the pipeline on a push event
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm // This checks out the latest changes from the repository
            }
        }
        
        stage('Build') {
            steps {
                // Add your build steps here, e.g.:
                sh 'echo "Building the project..."'
                sh 'yarn'
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
