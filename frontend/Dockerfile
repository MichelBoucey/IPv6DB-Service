FROM alpine:3.19 AS build

ENV PATH="/root/.ghcup/bin:$PATH" \
    BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
    BOOTSTRAP_HASKELL_GHC_VERSION=latest \
    BOOTSTRAP_HASKELL_CABAL_VERSION=latest \
    BOOTSTRAP_HASKELL_ADJUST_BASHRC=P

RUN apk add --no-cache binutils-gold curl gcc g++ gmp-dev libc-dev \
    libffi-dev make musl-dev ncurses-dev perl tar xz zlib-dev git \
    && curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

WORKDIR /tmp
RUN git clone https://github.com/MichelBoucey/IPv6DB.git

WORKDIR /tmp/IPv6DB
RUN cabal install --installdir=/usr/local/bin/

FROM alpine:3.19

RUN apk add --no-cache gmp-dev

COPY --from=build /usr/local/bin/ipv6db /usr/local/bin/

EXPOSE 4446
ENTRYPOINT [ "/usr/local/bin/ipv6db", "-h", "0.0.0.0", "--redis-host", "ipv6db_backend" ]
