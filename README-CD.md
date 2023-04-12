Part 1
--------
Amended the workflows.yml to include a new label under "On:" named "tags: - v*.*.*", and also a job named "Docker meta", which should contain all the information needed to automatically generate tags on new images pushed to the repository. In order for this to work, also had to add "${{ steps.meta.outposts.tags }}" and "labels:${{ steps.meta.outposts.labels }}" to the "Build and Push" job.
||
The workflow is logging into both repositories, building our docker image, and pushing it to dockerhub and github simulatneously with the same tags.
||

Link to the dockerhub repo:
https://hub.docker.com/repository/docker/imatsoup/ceg3120-john/general

Part 2
--------
test
Part 3
--------
