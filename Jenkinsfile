pipeline{
    agent any
    tools {go '1.24.2'}

    stages{
    stage('Cleanup Workspace'){
        steps{
            cleanWs()
        }

    }
    stage("Checkout from SCM"){
        git branch: 'main', 'url':'https://github.com/Blessings9/albums-api.git'
    }
}
}