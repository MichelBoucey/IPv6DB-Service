FROM ubuntu

RUN apt update && apt -y install git curl

RUN curl -sSL https://get.haskellstack.org/ | sh -s - -f

RUN cd /tmp && \
    git clone https://github.com/MichelBoucey/IPv6DB.git && \
    cd IPv6DB && \
    stack install --local-bin-path=/usr/local/bin/ && \
    cd && \
    rm -rf /root/.stack /tmp/IPv6DB

RUN apt -y remove git curl gcc && apt -y autoremove

EXPOSE 4446

ENTRYPOINT /usr/local/bin/ipv6db -h 0.0.0.0 --redis-host ipv6db_backend
