FROM ubuntu:18.04 AS builder

SHELL ["/bin/bash", "-c"]

WORKDIR /root

RUN apt-get update -qq && \
    apt-get install -qq --no-install-recommends \
      g++ \
      make \
      cmake \
      tar && \
    rm -rf /var/lib/apt/lists/*

# Copy over the git repo into this repo
COPY . project

RUN mkdir build && \
    pushd build && \
    cmake -DENABLE_CODECOV=ON ../project && \
    make -j$(nproc) && \
    popd && \
    rm -rf project

# Ship only the necessary in this stage
FROM ubuntu:18.04

RUN apt-get update -qq && \
    apt-get install -qq --no-install-recommends \
      cmake \
      git \
      curl \
      lcov \
      ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /root/build /root/build

WORKDIR /root/build
