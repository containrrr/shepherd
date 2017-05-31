FROM docker:latest
LABEL maintainer "djimaze"
COPY shepherd /usr/local/bin/shepherd

ENTRYPOINT ["/usr/local/bin/shepherd"]
