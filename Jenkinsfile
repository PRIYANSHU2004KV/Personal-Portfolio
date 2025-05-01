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
                    docker.build('personal-portfolio:latest')
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop and remove existing container if running
                    bat '''
                        docker stop personal-portfolio || true
                        docker rm personal-portfolio || true
                        docker run -d --name personal-portfolio -p 80:80 personal-portfolio:latest
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
