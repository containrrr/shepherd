FROM docker

RUN apk add --update --no-cache bash curl tzdata

COPY shepherd /usr/local/bin/shepherd

ENTRYPOINT ["/usr/local/bin/shepherd"]
