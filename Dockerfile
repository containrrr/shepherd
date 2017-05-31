FROM docker

ENV SLEEP_TIME='5m'

COPY shepherd /usr/local/bin/shepherd

ENTRYPOINT ["/usr/local/bin/shepherd"]
