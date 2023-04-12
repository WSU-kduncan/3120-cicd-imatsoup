Part 1
--------
Amended the workflows.yml to include a new label under "On:" named "tags: - v*.*.*", and also a job named "Docker meta", which should contain all the information needed to automatically generate tags on new images pushed to the repository. In order for this to work, also had to add "${{ steps.meta.outposts.tags }}" and "labels:${{ steps.meta.outposts.labels }}" to the "Build and Push" job.  <br/>

The workflow is logging into both repositories, building our docker image, and pushing it to dockerhub and github simulatneously with the appropriate tags added to dockerhub. <br/>

Link to the dockerhub repo: https://hub.docker.com/repository/docker/imatsoup/ceg3120-john/general <br/>

Part 2
--------

Docker installation: update the package index with sudo apt-get update, use sudo apt-get install to install any missing dependencies (ca-certificates, curl, gnupg), setup the official gpg key and dockerhub repository, then type sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin to install docker on the cli. <a href="https://docs.docker.com/engine/install/ubuntu/">[SOURCE]</a> <br/>

Script contents: #!bin/bash <br/>
                 #Pull the latest docker image from dockerhub  <br/>
                 sudo docker pull imatsoup/ceg3120-john:latest <br/>
                 #Restart the docker container <br/>
                 sudo docker restart httpd-docker-01 <br/>
                 <br/>
Installing webhook: sudo apt-get install webhook, then we need to configure our hooks.json, which will execute our script. <br/> 

webhook taskfile: The taskfile contains the id of the webhook, the location of the scripts that will be run on triggering the webhook, and the working directory the scripts will be using to properly execute. </br>

Starting the webhook: run the command webhook -hooks <path-to-webhooks.json> -verbose, then visit http://yourwebserver:9000/hooks/redeploy-webhook to trigger the webhook to run our bash script. <br/>

Configuring github to use the webhook: Under settings, select "webhooks", then enter the url, a name for the secret that will act as a keyphrase for triggering the webhook, and then select your trigger preference for the webhook. For our purposes, we will select individual events, pushes, and workflow runs. <br/>

Configuring dockerhub to use the webhook: under general settings at the desired repository, select "webhooks", then enter a name and url for your new webhook before pressing "create" to add the webhook to dockerhub. <br/>

In our workflow, we can add a "redeploy" job that will trigger the webhook whenever we build and push to dockerhub : <br/>

![image](https://user-images.githubusercontent.com/93290208/231549963-59f0e289-bc96-4a42-9224-977a313f5d83.png) <br/>


<a href="https://levelup.gitconnected.com/automated-deployment-using-docker-github-actions-and-webhooks-54018fc12e32">[SOURCE]</a> <br/>


Part 3
--------
<br/>
My best attempt at a diagram explaining CD how I understand it at this time. <br/>

![image](https://user-images.githubusercontent.com/93290208/231564535-ff1b91ba-2b5e-4e60-8e1f-632d3f8711f4.png)

