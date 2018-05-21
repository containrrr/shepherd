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

You can enable private registry authentication by setting the `WITH_REGISTRY_AUTH` variable.

Example:

    docker service create --name shepherd \
                        --constraint "node.role==manager" \
                        --env SLEEP_TIME="5m" \
                        --env BLACKLIST_SERVICES="shepherd my-other-service" \
                        --env WITH_REGISTRY_AUTH="true" \
                        --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock,ro \
                        --mount type=bind,source=/root/.docker/config.json,target=/root/.docker/config.json,ro \
                        mazzolino/shepherd

#### Manual mode

It is recommended to let Docker use its built-in _image resolution and pulling logic_, particularly if your Swarm has more than a single node, but if such logic is not working as you expect (i.e images are pulled without tags), you can try enabling the _manual mode_. Shepherd will manually pull locally the latest tagged image from the registry, check if its newer compared to the one in use by the service (by comparing their unique identifiers, called _digests_), and in such case it will try and force Docker to update the service with it.

You can enable the _manual mode_ for every non-blacklisted service by setting the environment variable `MANUAL_MODE: "all"` on Shepherd service, or instead you can add the label `MANUAL_MODE: "true"` (include the quotes) just to certain services.

## How does Shepherd work?

Shepherd just triggers updates by updating the image specification for each service, removing the current digest.

Most of the work is thankfully done by Docker which [resolves the image tag, checks the registry for a newer version and updates running container tasks as needed](https://docs.docker.com/engine/swarm/services/#update-a-services-image-after-creation).

Also, Docker handles all the work of [applying rolling updates](https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/). So at least with replicated services, there should be no noticeable downtime.
