PART 1. 
  After installing Docker(and any of the other things it needs to work), I create a Dockerfile (included in the repo) that will create an apache2 image in a dockerized container, and copy the contents of my website's 'index.html' to the htdocs folder in the apache directory of the container we are going to make. I then build the image by typing "sudo docker build -t apache-docker .", then get the container running by typing "sudo docker run -d --name httpd-docker-01 -p 80:80 apache-docker", which gets the container we made running an apache server hosting our website on port 80. Once I've confirmed its working by checking the website in my browser, I then type "sudo docker stop 0a430ac31b02be6ec7056205f436fd101c390579815d704478f67ba3774b22c7" to stop the container from running.

PART 2.
  A. On the Docker Hub main page, once you've logged in, select "Repostiories, then click the blue button labeled "Create Repository". Name the repository, add a description if its desired, then make sure 'Public' visibility is selected, then click "Create".
  B. We need to create a new access token on Docker Hub to login from the CLI. To do that, on the Docker Hub website we click "Settings", then we click security, and under "Access Tokens" we click "New Access Token". We write a description for the token, copy the token down, then run the following command in our CLI: "docker login -u yourusername". We then enter our copied token when prompted for a password to login.
  C. First we need to rename our repository to match the repository we made on Docker Hub using "sudo docker tag currentname username/reponame:tag". Then just type "sudo docker push yourusername/yourrepo" to push your repository to Docker Hub.
  D. On Github, click "Settings", then under the "Security" category select "Secrets and Variables". In the new menu, click "New Repository Secret", then name your secret and add the information you need github to hold onto. In our secrets we have the username of our Docker Hub account and the access token needed to access the repositories from a CLI.