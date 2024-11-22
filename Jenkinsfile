pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Pull the latest code from the repository
                git 'https://github.com/your-repo/your-html-page.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $DOCKERHUB_USERNAME/$IMAGE_NAME .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh 'docker push $DOCKERHUB_USERNAME/$IMAGE_NAME'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Optionally remove the Docker image after pushing
                    sh 'docker rmi $DOCKERHUB_USERNAME/$IMAGE_NAME'
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker containers if necessary
            sh 'docker ps -a -q | xargs docker rm -f || true'
        }
    }
}
