Part 1
--------
Amended the workflows.yml to include a new label under "On:" named "tags: - v*.*.*", and also a job named "Docker meta", which should contain all the information needed to automatically generate tags on new images pushed to the repository. In order for this to work, also had to add "${{ steps.meta.outposts.tags }}" and "labels:${{ steps.meta.outposts.labels }}" to the "Build and Push" job.

Part 2
--------

Part 3
--------
