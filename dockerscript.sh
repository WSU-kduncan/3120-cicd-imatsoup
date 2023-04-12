#!bin/bash
#Pull the latest docker image from dockerhub
sudo docker pull imatsoup/ceg3120-john:latest
#Then, restart the docker container
sudo docker restart httpd-docker-01
