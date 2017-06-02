# Shepherd

A Docker swarm service for automatically updating your services whenever their base image is refreshed.

## Usage

    docker service create --name shepherd \
                          --replicas 1 \
                          --constraint "node.role==manager" \
                          --env SLEEP_TIME='5m' \
                          --env SERVICE_LIST='services.lst"
                          --mount type=bind,source=/path_to_service_list,target=/tmp,ro \
                          --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock,ro \
                          mazzolino/shepherd

Shepherd will try to update your services every 5 minutes but you can change this value by chengin the value of the `SLEEP_TIME` variable.
You need to create a file called services.lst which contain the list of services you have and which ones can be updated using shepherd and which one can't 

To update a service called shepherd, you will add w:shepherd in services.lst
to prevent update of a service called registry you will add b:registry in services.lst
a service not declared it services.lst will be considered as blacklisted (b:) and won't be upograded

## How does it work?

Shepherd just triggers updates by updating the image specification for each service, removing the current digest.

Most of the work is thankfully done by Docker which [resolves the image tag, checks the registry for a newer version and updates running container tasks as needed](https://docs.docker.com/engine/swarm/services/#update-a-services-image-after-creation).

Also, Docker handles all the work of [applying rolling updates](https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/). So at least with replicated services, there should be no noticeable downtime.
