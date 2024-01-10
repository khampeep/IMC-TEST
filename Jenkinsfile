pipeline {
    agent any
    environment {
        APP_NAME = "test app name"
    }
    stages {
        stage('Build Image' ) {
            steps {
                sh "echo ${env.APP_NAME}"
            }
        }
        stage('Build Stage (Docker)') {
            agent {label 'build-server'}
            steps {
                sh "docker build -t ghcr.io/khampeep/kp-virus ."
            }
        }
        stage('Deliver Docker Image') {
            agent {label 'build-server'}
            steps {
                withCredentials(
                [usernamePassword(
                    credentialsId: 'khampeep',
                    passwordVariable: 'gitlabPassword',
                    usernameVariable: 'gitlabUser'
                )])
                {
                sh "docker login ghcr.io -u ${env.githubUser} -p ${env.githubPassword}"
                sh "docker push ghcr.io/khampeep/kp-virus"
                }
            }
        }
    }
}