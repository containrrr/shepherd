# Shepherd

A Docker swarm service for automatically updating your services whenever their base image is refreshed.

## Usage

    docker service create --name shepherd \
                          --replicas 1 \
                          --constraint "node.role==manager" \
                          --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock,ro \
                          mazzolino/shepherd

### Configuration

Shepherd will try to update your services every 5 minutes by default. You can adjust this value using the `SLEEP_TIME` variable.

You can prevent services from being updated bei appending them to the `BLACKLIST_SERVICES` variable. This should be a space-separated list of service names.

Example:

    docker service create --name shepherd \
                        --constraint "node.role==manager" \
                        --env SLEEP_TIME="5m" \
                        --env BLACKLIST_SERVICES="shepherd my-other-service" \
                        --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock,ro \
                        mazzolino/shepherd

## How does it work?

Shepherd just triggers updates by updating the image specification for each service, removing the current digest.

Most of the work is thankfully done by Docker which [resolves the image tag, checks the registry for a newer version and updates running container tasks as needed](https://docs.docker.com/engine/swarm/services/#update-a-services-image-after-creation).

Also, Docker handles all the work of [applying rolling updates](https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/). So at least with replicated services, there should be no noticeable downtime.
