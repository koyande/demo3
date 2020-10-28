 pipeline {
  agent any
    options {
        skipDefaultCheckout true
    }
  environment {
       TF_VAR_okta_group_name="${group_name}"
       TF_VAR_group_description="${group_description}"
    }
  parameters {
        string(name: 'GROUP_NAME', defaultValue: 'blackpanther', description: 'Group Name for OKTA',)
        string(name: 'GROUP_DESCRIPTION', defaultValue: 'avengers', description: 'Description for Group',)
    }    
  stages {

    stage('TF Plan') {
      steps {
          sh 'terraform init'
          sh """
          export TF_VAR_okta_group_name=${params.group_name}
          export TF_VAR_group_description=${params.group_description}
  
          terraform plan -out myplan
          """
        }
      }


    stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }

    stage('TF Apply') {
      steps {
          sh """
          export TF_VAR_okta_group_name=${params.groupname}
          export TF_VAR_group_description=${params.description}
          
          terraform apply -input=false -auto-approve myplan 
          """
        }
      }
  }
  }
