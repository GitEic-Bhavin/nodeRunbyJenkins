pipeline {
    agent any

    tools {
        nodejs node-10.8.0
    }

    parameters {
        choices(choice: ["master", "main"], description: "choose branch", name: "CheckoutBranch")
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${params.CheckoutBranch}", url: 'https://github.com/GitEic-Bhavin/nodeRunbyJenkins.git'
            }
        }
        stage('Install Npm') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }
        stage('Check Npm Version') {
            steps {
                sh 'npm -v'
            }
        }
        stage('Test Npm Code') {
            steps {
                sh 'timeout 5 npm start'
            }
        }
        stage('Host Nodejs Web') {
            steps {
                sh 'npm start'
            }
        }
    }
}