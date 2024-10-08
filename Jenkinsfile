pipeline {
    agent any

    tools {
        nodejs 'node-10.8.0'
    }

    // parameters {
    //     choices(choice: ["master", "main"], description: "choose branch", name: "CheckoutBranch")
    // }

    stages {
        stage('Checkout') {
            steps {
                // git branch: "${params.CheckoutBranch}", url: 'https://github.com/GitEic-Bhavin/nodeRunbyJenkins.git'
                git branch: "master", url: 'https://github.com/GitEic-Bhavin/nodeRunbyJenkins.git'

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
        stage('Build Npm') {
            steps{
                script {
                    sh 'npm run build'
                }
            }
        }
        // stage('Test Npm Code') {
        //     steps {
        //         script {
        //             sh 'timeout 5 npm start'
        //         }
        //     }
        // stage('Host Nodejs Web') {
        //     steps {
        //         script {
        //             // sh 'npm start'
        //             sh 'timeout 5 npm start'
        //         }
        //     }
        // }
        stage('DockerBuild') {
            steps {
                script {
                    sh 'docker build . -t "bhavin1099/npm-jenkins"'
                }
            }
        }
    }
}