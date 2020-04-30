FROM docker

ENV SLEEP_TIME='5m'
ENV FILTER_SERVICES=''

RUN apk add --update --no-cache bash curl

COPY shepherd /usr/local/bin/shepherd
COPY shepherd_healthcheck /usr/local/bin/shepherd_healthcheck
    
HEALTHCHECK CMD /usr/local/bin/shepherd_healthcheck

ENTRYPOINT ["/usr/local/bin/shepherd"]
