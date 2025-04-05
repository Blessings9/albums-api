pipeline{
    agent any
    tools {go '1.24.2'}
    environment{
        APP_NAME = "album-api"
        RELEASE = "1.0.0"
        DOCKER_USER="blessmwafu"
        DOCKER_PASS = 'dockerhub'
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
    }
    stages{
        stage('Cleanup Workspace'){
        steps{
            cleanWs()
        }

    }
    stage("Checkout from SCM"){
       steps{
        git branch: 'main', 'url':'https://github.com/Blessings9/albums-api.git'
    }
    }
    stage("Build & Push Docker "){
        steps{
            script{
               docker.withRegistry('',DOCKER_PASS){
                docker_image = docker.build "${IMAGE_NAME}"
               }

               docker.withRegistry('',DOCKER_PASS){
                docker_image.push("${IMAGE_TAG}")
               }
            }

        }
    }
}
}