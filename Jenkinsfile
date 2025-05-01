pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/PRIYANSHU2004KV/Personal-Portfolio.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from Dockerfile at the repo root
                    docker.build('personal-portfolio:latest')
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop and remove existing container if present, then run a new one on port 8090
                    bat '''
                        docker stop personal-portfolio || echo Container not running
                        docker rm personal-portfolio || echo Container not found
                        docker run -d --name personal-portfolio -p 8090:80 personal-portfolio:latest
                    '''
                }
            }
        }

        stage('Clean Up Docker Cache') {
            steps {
                bat 'docker system prune -f'
            }
        }
    }

    post {
        always {
            echo 'CI/CD pipeline completed for Personal Portfolio.'
        }
    }
}
