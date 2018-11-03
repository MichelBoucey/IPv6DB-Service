FROM ubuntu:18.04 AS build
RUN apt update && apt -y install git curl
RUN [ "/bin/bash", "-c", "set -o pipefail && curl -sSL https://get.haskellstack.org/ | sh" ]
WORKDIR /tmp
RUN git clone https://github.com/MichelBoucey/IPv6DB.git
WORKDIR /tmp/IPv6DB
RUN stack install --local-bin-path=/usr/local/bin/

FROM ubuntu:18.04
COPY --from=build /usr/local/bin/ipv6db /usr/local/bin/
EXPOSE 4446
ENTRYPOINT [ "/usr/local/bin/ipv6db", "-h", "0.0.0.0", "--redis-host", "ipv6db_backend" ]
