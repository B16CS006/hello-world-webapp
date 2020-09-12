pipeline {
	agent any
	tools{
		jdk 'openjdk-8'
		maven 'maven-3'
		dockerTool 'docker'
    	}
      parameters {
        gitParameter branchFilter: 'origin/(.*)', defaultValue: 'master', name: 'BRANCH', type: 'PT_BRANCH'
      }
	stages {
		stage('Build'){
			steps{
			    git branch: "${params.BRANCH}", url:'https://github.com/b16cs006/hello-world-webapp/'
			}
		}

		stage("Deploy") {
			steps {
				script{
					withDockerRegistry( toolName: 'docker', credentialsId:'c867552a-ac40-49f4-8599-d2cf53571267') {
					    image = docker.build('b16cs006/hello-world-webapp:latest')
					    image.push()
					}
				}
			}
		}

	}

        post {
		success {
		    echo "success"
		    script{
			shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
			def reqBody = '{"text":"Project Name: hello-world-webapp\nBuild Commit: '+shortCommit+'\nBuild Status: s!!"}'
			httpRequest contentType: 'APPLICATION_JSON', httpMode: 'POST', requestBody:reqBody , responseHandle: 'NONE', url: url, wrapAsMultipart: false
		    }
		}
		failure {
		    echo "fail"
		    script{
			shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
			def reqBody = '{"text":"Project Name: hello-world-webapp\nBuild Commit: '+shortCommit+'\nBuild Status: f!!"}'
			httpRequest contentType: 'APPLICATION_JSON', httpMode: 'POST', requestBody:reqBody , responseHandle: 'NONE', url: url, wrapAsMultipart: false
		    }
		}
    	}
}
