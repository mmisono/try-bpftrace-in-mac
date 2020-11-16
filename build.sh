#!/bin/bash

# linukit kernel version
KERNEL_VERSION=`docker run --rm -it alpine uname -r | cut -d'-' -f1`
BPFTRACE_VERSION=${BPFTRACE_VERSION:-v0.11.4}

pushd docker

docker build \
    --build-arg KERNEL_VERSION=${KERNEL_VERSION} \
    --build-arg BPFTRACE_VERSION=${BPFTRACE_VERSION} \
    -t bpftrace_mac:${KERNEL_VERSION} .

popd
