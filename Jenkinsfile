pipeline {
  agent any
  environment{
    TF_IN_AUTOMATION = '1'
  }
  stages {
    stage('tf init'){
      steps {
        sh 'terraform init'
      }
    }
    stage('tf plan') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: 'vcenter_creds', passwordVariable: 'vsphere_password', usernameVariable: 'vsphere_user'), usernamePassword(credentialsId: 'ansible_become_creds', passwordVariable: 'ansible_become_password', usernameVariable: 'ansible_become_user'), usernamePassword(credentialsId: 'ansible_ssh_creds', passwordVariable: 'ansible_pw', usernameVariable: 'ansible_user'), usernamePassword(credentialsId: 'join_ad_creds', passwordVariable: 'ad_pass', usernameVariable: 'ad_user')]) {
            sh "terraform plan -out=tfplan.out -var 'vsphere_user=${vsphere_user}' -var 'vsphere_password=${vsphere_password}' -var 'ansible_user=${ansible_user}' -var 'ansible_pw=${ansible_pw}' -var 'ansible_become_user=${ansible_become_user}' -var 'ansible_become_password=${ansible_become_password}' -var 'ad_user=${ad_user}' -var 'ad_pass=${ad_pass}' "
          }
        }
      }
    }
    stage('tf apply') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: 'vcenter_creds', passwordVariable: 'vsphere_password', usernameVariable: 'vsphere_user'), usernamePassword(credentialsId: 'ansible_become_creds', passwordVariable: 'ansible_become_password', usernameVariable: 'ansible_become_user'), usernamePassword(credentialsId: 'ansible_ssh_creds', passwordVariable: 'ansible_pw', usernameVariable: 'ansible_user'), usernamePassword(credentialsId: 'join_ad_creds', passwordVariable: 'ad_pass', usernameVariable: 'ad_user')]) {
            sh 'terraform apply -input=false -auto-approve tfplan.out'
          }
        }
      }
    }
    stage('ansible-playbook-standard-build') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: 'ansible_become_creds', passwordVariable: 'ansible_become_password', usernameVariable: 'ansible_become_user'), usernamePassword(credentialsId: 'ansible_ssh_creds', passwordVariable: 'ansible_pw', usernameVariable: 'ansible_user'), usernamePassword(credentialsId: 'join_ad_creds', passwordVariable: 'ad_pass', usernameVariable: 'ad_user')]) {
            sh "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts standard-build.yml --extra-vars 'ad_user=${ad_user} ad_pass=${ad_pass} ansible_become_user=${ansible_become_user} ansible_become_password=${ansible_become_password} ansible_ssh_user=${ansible_user} ansible_ssh_pass=${ansible_pw}'"
          }
        }
      }
    }
    // stage('ansible-playbook-automox') {
    //   steps {
    //     script {
    //       withCredentials([usernamePassword(credentialsId: 'ansible_become_creds', passwordVariable: 'ansible_become_password', usernameVariable: 'ansible_become_user'), usernamePassword(credentialsId: 'ansible_ssh_creds', passwordVariable: 'ansible_pw', usernameVariable: 'ansible_user')]) {
    //         sh "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts get-automox.yml --extra-vars 'organization=f64dd660-34e5-4f55-8de1-d199c52dc918 ansible_become_user=${ansible_become_user} ansible_become_password=${ansible_become_password} ansible_ssh_user=${ansible_user} ansible_ssh_pass=${ansible_pw}'"
    //       }
    //     }
    //   }
    // }
    // stage('ansible-playbook-tomcat10') {
    //   steps {
    //     script {
    //       withCredentials([usernamePassword(credentialsId: 'ansible_become_creds', passwordVariable: 'ansible_become_password', usernameVariable: 'ansible_become_user'), usernamePassword(credentialsId: 'ansible_ssh_creds', passwordVariable: 'ansible_pw', usernameVariable: 'ansible_user')]) {
    //         sh "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts tomee.yml --extra-vars 'ansible_become_user=${ansible_become_user} ansible_become_password=${ansible_become_password} ansible_ssh_user=${ansible_user} ansible_ssh_pass=${ansible_pw}'"
    //       }
    //     }
    //   }
    // }
  }
}