pipeline {
    agent any

    // environment {
    //     IMAGE_NAME = "html-page"
    //     DOCKERHUB_USERNAME = credentials('dockerhub-credentials') // Set this to your Docker Hub username
    //     DOCKERHUB_PASSWORD = credentials('dockerhub-credentials') // Set this to Jenkins credentials for Docker Hub
    // }

    stages {
        // stage('Clone Repository') {
        //     steps {
        //         // Pull the latest code from the repository
        //         git branch: 'main', url: 'https://github.com/Sumerali5581/jenkins_try.git'
        //     }
        //}
         stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t app .'
                }
            }
        }

        stage('Run Application') {
            steps {
                echo 'Running Docker container...'
                bat "docker run -d -p 5000:5000 app"
            }
        }

        // stage('Login to Docker Hub') {
        //     steps {
        //         script {
        //             // Login to Docker Hub
        //             withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
        //                 sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
        //             }
        //         }
        //     }
        // }

        // stage('Push Docker Image') {
        //     steps {
        //         script {
        //             // Push the Docker image to Docker Hub
        //             sh 'docker push $DOCKERHUB_USERNAME/$IMAGE_NAME'
        //         }
        //     }
        // }

        // stage('Clean Up') {
        //     steps {
        //         script {
        //             // Optionally remove the Docker image after pushing
        //             sh 'docker rmi $DOCKERHUB_USERNAME/$IMAGE_NAME'
        //         }
        //     }
        // }
    }

    // post {
    //     always {
    //         // Ensure Docker containers are cleaned up after pipeline runs
    //         sh 'docker ps -a -q | xargs docker rm -f || true'
    //     }
    // }
}
