FROM base/archlinux

RUN useradd -M -s /usr/bin/nologin ipv6db

COPY --chown=ipv6db:ipv6db ipv6db /usr/bin/

EXPOSE 4446

ENTRYPOINT /usr/bin/ipv6db -h 0.0.0.0 --redis-host ipv6db_backend
