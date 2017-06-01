# Shepherd

A Docker swarm service for automatically updating your services whenever their base image is refreshed.

## Usage

    docker service create --name shepherd \
                          --replicas 1 \
                          --constraint "node.role==manager" \
                          --env SLEEPTIME='5m" \
                          --mount type=bind,source=/path_to_blacklist_file,target=/tmp,ro \
                          --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock,ro \
                          mazzolino/shepherd

Shepherd will try to update your services every 5 minutes but you can change this value by chengin the value of the SLEEPTIME variable.
if you want to blacklist a service or more than one add the name of the services (one per line ) in a file called blacklist and mount it  as describe in the Usage example

## How does it work?

Shepherd just triggers updates by updating the image specification for each service, removing the current digest.

Most of the work is thankfully done by Docker which [resolves the image tag, checks the registry for a newer version and updates running container tasks as needed](https://docs.docker.com/engine/swarm/services/#update-a-services-image-after-creation).

Also, Docker handles all the work of [applying rolling updates](https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/). So at least with replicated services, there should be no noticeable downtime.
