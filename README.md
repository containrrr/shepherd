# Shepherd

[![Build Status](https://ci.strahlungsfrei.de/api/badges/djmaze/shepherd/status.svg)](https://ci.strahlungsfrei.de/djmaze/shepherd)
[![Docker Stars](https://img.shields.io/docker/stars/mazzolino/shepherd.svg)](https://hub.docker.com/r/mazzolino/shepherd/) [![Docker Pulls](https://img.shields.io/docker/pulls/mazzolino/shepherd.svg)](https://hub.docker.com/r/mazzolino/shepherd/)

A Docker swarm service for automatically updating your services whenever their base image is refreshed.

## Usage

    docker service create --name shepherd \
                          --constraint "node.role==manager" \
                          --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock,ro \
                          mazzolino/shepherd

## Or with docker-compose

    version: "3"
    services:
      ...
      shepherd:
        build: .
        image: mazzolino/shepherd
        volumes:
          - /var/run/docker.sock:/var/run/docker.sock
        deploy:
          placement:
            constraints:
            - node.role == manager

### Configuration

Shepherd will try to update your services every 5 minutes by default. You can adjust this value using the `SLEEP_TIME` variable.

You can prevent services from being updated by appending them to the `IGNORELIST_SERVICES` variable. This should be a space-separated list of service names.

Alternatively you can specify a filter for the services you want updated using the `FILTER_SERVICES` variable. This can be anything accepted by the filtering flag in `docker service ls`.

You can set Shepherd to roll back a service to the previous version if the update fails by setting the `ROLLBACK_ON_FAILURE` variable.

You can control additional parameters for the `docker service update` and `docker service update --rollback` calls using the variables `UPDATE_OPTIONS` and `ROLLBACK_OPTIONS`.

You can enable private registry authentication by setting the `WITH_REGISTRY_AUTH` variable.

If you need to authenticate to a registry (for example in order to get around the [Docker Hub rate limits](https://www.docker.com/increase-rate-limit)), you can set the variable `REGISTRY_USER` and store the password either in a [docker secret](https://docs.docker.com/engine/swarm/secrets/) named `shepherd_registry_password` or in the environment variable `REGISTRY_PASSWORD`. If you are not using Docker Hub but a private registry, set `REGISTRY_HOST` to the hostname of your registry.

It is also possible to put all authentication information in a secret file. This approach is required if you need to authenticate with multiple accounts to the same registry (eg authenticate to the Gitlab registry for images from different projects). The content of the file is `<TAB>` separated and has 4 columns:
* id: an identifier for the account. This should be an acceptable [Docker config name](https://docs.docker.com/engine/swarm/configs/).
* registry: the registry to authenticate against, eg `registry.gitlab.com`
* login: the user to authenticate as
* password: the password to authenticate with
Lines starting with `#` are comments, and are ignored, as are invalid lines.
Here is an example:
```
blog	registry.gitlab.com	gitlab+deploy-token-5123674	ssw2Nrd2
```
Create and edit that file locally, eg at the location `private/shepherd-registries-auth`, and create the docker secret with
```
docker secret create shepherd-registries-auth private/shepherd-registries-auth
```
You need to make the secret available to shepherd with the `secrets` key:
```
services:
  app:
    image: mazzolino/shepherd
    secrets:
      - shepherd-registries-auth
secrets:
    shepherd-registries-auth:
      external: true
```
You also need to add a label `shepherd.auth.config` to the container to be updated specifying which line of the secret file should be used. The value of that label should be the `id` in the secret file:

```
    deploy:
        labels:
            - shepherd.enable=true
            - shepherd.auth.config=blog
```

You can enable connection to insecure private registry by setting the `WITH_INSECURE_REGISTRY` variable.

You can force image deployment whatever the architecture by setting the `WITH_NO_RESOLVE_IMAGE` variable.

You can enable notifications on service update with apprise, using the [apprise microservice](https://github.com/djmaze/apprise-microservice) and the `APPRISE_SIDECAR_URL` variable. See the file [docker-compose.apprise.yml](docker-compose.apprise.yml) for an example.

You can enable old image autocleaning on service update by setting the `IMAGE_AUTOCLEAN_LIMIT` variable.

You can enable one shot running with `RUN_ONCE_AND_EXIT` variable.

If you care about log entries having the right timezone, you can set the `TZ` variable to the correct value (make sure to *not* include quotation marks in the variable value).

Example:

    docker service create --name shepherd \
                        --constraint "node.role==manager" \
                        --env SLEEP_TIME="5m" \
                        --env IGNORELIST_SERVICES="shepherd my-other-service" \
                        --env WITH_REGISTRY_AUTH="true" \
                        --env WITH_INSECURE_REGISTRY="true" \
                        --env WITH_NO_RESOLVE_IMAGE="true" \
                        --env FILTER_SERVICES="label=com.mydomain.autodeploy" \
                        --env APPRISE_SIDECAR_URL="apprise-microservice:5000" \
                        --env IMAGE_AUTOCLEAN_LIMIT="5" \
                        --env RUN_ONCE_AND_EXIT="true" \
                        --env ROLLBACK_ON_FAILURE="true" \
                        --env UPDATE_OPTIONS="--update-delay=30s" \
                        --env TZ=Europe/Berlin \
                        --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock,ro \
                        --mount type=bind,source=/root/.docker/config.json,target=/root/.docker/config.json,ro \
                        mazzolino/shepherd

## How does it work?

Shepherd just triggers updates by updating the image specification for each service, removing the current digest.

Most of the work is thankfully done by Docker which [resolves the image tag, checks the registry for a newer version and updates running container tasks as needed](https://docs.docker.com/engine/swarm/services/#update-a-services-image-after-creation).

Also, Docker handles all the work of [applying rolling updates](https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/). So at least with replicated services, there should be no noticeable downtime.
