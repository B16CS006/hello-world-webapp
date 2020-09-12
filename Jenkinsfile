pipeline {
	agent any
	tools{
		dockerTool 'docker'
    	}
      parameters {
	string(name: 'BRANCH', defaultValue: 'master', description: 'Which branch you want to consider for build?')
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
		always{
			script{
				shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
				def reqBody = '{"text":"Project Name: hello-world-webapp\nBranch: ' + params.BRANCH + '\nBuild Commit: '+shortCommit+'\nBuild Status: ' + currentBuild.result + '"}'
				def url = 'https://api.flock.com/hooks/sendMessage/da560f49-2283-4bc0-bdb5-86c3f7c0c372' 
				echo reqBody

				def response = httpRequest url: url, contentType: 'APPLICATION_JSON', httpMode: 'POST', requestBody: reqBody
				echo "Status: " + response.status
				echo "Status: " + response.content
			}
		}
    	}
}
