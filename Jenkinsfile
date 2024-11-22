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
         stage('Clone Repository') {
            steps {
                echo 'Cloning Repository...'
                git branch: 'main', url: 'https://github.com/Sumerali5581/jenkins_try.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t app ."
            }
        }
        stage('Run Application') {
            steps {
                echo 'Running Docker container...'
                bat "docker run -d -p 8080:8080 app"
            }
        }
    }

    // post {
    //     always {
    //         // Ensure Docker containers are cleaned up after pipeline runs
    //         sh 'docker ps -a -q | xargs docker rm -f || true'
    //     }
    // }
}
