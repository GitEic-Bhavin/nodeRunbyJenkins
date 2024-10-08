pipeline {
    agent any

    tools {
        nodejs node-10.8.0
    }

    parameters {
        choices(choice: [])
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "", url: ''
            }
        }
    }
}