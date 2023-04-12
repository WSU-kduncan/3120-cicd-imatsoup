#!bin/bash
sudo docker stop httpd-docker-01
sudo docker rm httpd-docker-01
#Pull the latest docker image from dockerhub
sudo docker pull imatsoup/ceg3120-john:latest
#Then, restart the docker container
sudo docker run -d --name httpd-docker-01 -p 80:80 imatsoup/ceg3120-john
