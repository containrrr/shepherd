FROM docker:latest
LABEL maintainer "djimaze"
ENV SLEEPTIME='5m'

COPY shepherd /usr/local/bin/shepherd
ENTRYPOINT ["/usr/local/bin/shepherd","$SLEEPTIME"]
