 pipeline {

  agent any
  environment {
   TF_VAR_okta_group_name=${params.groupname}
   TF_VAR_okta_group_description=${params.description}
}

  
  stages {

    stage('TF Plan') {
      steps {
          sh 'terraform init'
          sh """
          export TF_VAR_okta_group_name=${params.groupname}
          export TF_VAR_group_description=${params.description}
          """
          sh 'terraform plan -out myplan'
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
          sh 'terraform apply -input=false myplan'
          sh """
          export TF_VAR_okta_group_name=${params.groupname}
          export TF_VAR_group_description=${params.description}
          """

        }
      }
  }

}
