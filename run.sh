#!/bin/bash

KERNEL_VERSION=`docker run --rm -it alpine uname -r | cut -d'-' -f1`

docker run --privileged --rm -it bpftrace_mac:${KERNEL_VERSION}
