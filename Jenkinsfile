pipeline {
  environment {
    registry = "adityaprabhakara/appjul12"
    registryCredential = 'dockerhubcred'
    dockerusername = 'adityaprabhakara'
    imagename = "appjul12"
  }
  agent any
  stages {
    stage('Building image') {
      steps{
        git url: 'https://github.com/AdityaSP/docker-devops'  
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
          
      }
        }
      }
      stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    
    stage('kubernetes runs') {
      steps{
        sh 'sed -i "s/BUILDNUMBER/$BUILD_NUMBER/" dep.yml'   
        sh 'sed -i "s/DOCKERUSER/' + dockerusername + '/" dep.yml'
        sh 'sed -i "s/IMAGENAME/' + imagename +'/" dep.yml'
        

        sh 'kubectl apply -f dep.yml || echo "nothing to create"' 
      }
    }
    }
  }
