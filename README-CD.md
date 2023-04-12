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

Starting the webhook: run the command webhook -hooks <path-to-webhooks.json> -verbose, then visit http://yourwebserver:9000/hooks/redeploy-webhook to trigger the webhook to run our bash script.

Configuring github to use the webhook: Under settings, select "webhooks", then enter the url, a name for the secret that will act as a keyphrase for triggering the webhook, and then select your trigger preference for the webhook. For our purposes, we will select individual events, pushes, and workflow runs.

Part 3
--------

