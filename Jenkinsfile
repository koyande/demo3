 pipeline {
  agent any
    options {
        skipDefaultCheckout true
    }
  environment {
       TF_VAR_okta_group_name="${GROUP_NAME}"
       TF_VAR_group_description="${GROUP_DESCRIPTION}"
    }
  parameters {
        string(name: 'GROUP_NAME', defaultValue: 'BlackPanther', description: 'Group Name',)
        string(name: 'GROUP_DESCRIPTION', defaultValue: 'Avengers', description: 'Description for Group',)
    }    
  stages {

    stage('TF Plan') {
      steps {
          sh 'terraform init'
          sh """
          export TF_VAR_okta_group_name=${params.GROUP_NAME}
          export TF_VAR_group_description=${params.GROUP_DESCRIPTION}
  
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
          export TF_VAR_okta_group_name=${params.GROUP_NAME}
          export TF_VAR_group_description=${params.GROUP_DESCRIPTION}
          
          terraform apply -input=false -auto-approve myplan 
          """
        }
      }
  }
  }
