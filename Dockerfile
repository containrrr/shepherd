FROM docker:latest
LABEL maintainer "djimaze"
ENV sleep_time='5m'

COPY shepherd /usr/local/bin/shepherd
ENTRYPOINT ["/usr/local/bin/shepherd","$sleep_time"]
