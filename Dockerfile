FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libcurl4-openssl-dev \
    libjansson-dev \
    libgmp-dev \
    automake \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/tpruvot/cpuminer-multi /cpuminer-multi
WORKDIR /cpuminer-multi
RUN ./build.sh

ENTRYPOINT ["./cpuminer"]
