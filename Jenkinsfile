pipeline {
    agent any

    environment {
        IMAGE_NAME = "ratuldeveloper01/my-laravel-app"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                script {
                    docker.build("${env.IMAGE_NAME}:latest")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                echo 'Pushing to Docker Hub...'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image("${env.IMAGE_NAME}:latest").push()
                    }
                }
            }
        }
    }
}
