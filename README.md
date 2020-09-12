# Instructions
* Install the required modules with `pip install -r requirements.txt`
* This installs the falcon library and the gunicorn webserver.
* Run the app with `gunicorn app:app`
* You can test if the app is running by `curl http://localhost:8000/things`

# Assignment
You have a repository with a web application hosted here. You have been asked to deploy this to kubernetes. Since you're still in training, people have taken care of the kubernetes automation and have just asked you to automate the rest and send in a flock message on their group as soon as the new image is ready.

1. Write a Dockerfile to handle the packaging.
2. Write a **Jenkinsfile that allows you to select the branch to build from** at build time. 
3. Place links to your github forks with the Dockerfile and Jenkinsfile committed.
4. Also mention the latest commit id of the answer.

To aid you, you have been provided with the following links as reference and documentation:
* [How to use pip to install modules?] (https://pip.pypa.io/en/stable/reference/pip_install/#id19)
* [How to send http requests from jenkins?] (https://www.jenkins.io/doc/pipeline/steps/http_request/)
* [Where do I create a flock webhook?] (https://dev.flock.com/webhooks)
* [How do I create a flock webhook?] (https://docs.flock.com/display/flockos/Create+An+Incoming+Webhook)
* [Handling parameters in Jenkinsfile] (https://www.jenkins.io/doc/book/pipeline/jenkinsfile/#handling-parameters)

# Notes
* Use the following command when jenkins is not able to connect to Docker deamon
> systemctl start docker
* Use the following to intentionaly failed the build process in jenkins
> error("Build failed because of this and that..")
* You can show the dropdown for git branch using gitParameter, i.e. instead of writing the branch user can select the branch for the provided options which are fetch from repo itself
* You can use success, failure in Post instead of always, if you want to do completely different things in both cases
* You need to add following volume while running jenkins docker, as docker inside docker is not supported, so you need to use host machine docker
> /var/run/docker.sock:/var/run/docker.sock
