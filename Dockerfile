FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update -qq && \
    apt-get install -qq --no-install-recommends \
      g++ \
      make \
      cmake \
      lcov \
      wget \
      git \
      curl \
      ca-certificates \
      && \
    rm -rf /var/lib/apt/lists/*

COPY . project

RUN mkdir build && \
    cd build && \
    cmake -DENABLE_CODECOV=ON ../project && \
    make -j$(nproc)

WORKDIR /root/project
