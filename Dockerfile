FROM mazzolino/docker:20 AS builder

RUN apk add --update --no-cache git build-base

WORKDIR /git/
RUN git clone --depth 1 --branch v1.0.4 https://github.com/ksh93/ksh.git

ENV CCFLAGS='-D_BSD_SOURCE -D_DEFAULT_SOURCE'
RUN ksh/bin/package make
RUN ksh/bin/package install /ksh-install/ ksh

FROM mazzolino/docker:20

ENV SLEEP_TIME='5m'
ENV FILTER_SERVICES=''
ENV TZ='US/Eastern'
ENV VERBOSE='true'
ENV UPDATE_OPTIONS=''
ENV ROLLBACK_OPTIONS=''

RUN apk add --update --no-cache bash curl tzdata

COPY --from=builder /ksh-install/bin/ /bin/

COPY shepherd /usr/local/bin/shepherd

ENTRYPOINT ["/usr/local/bin/shepherd"]
