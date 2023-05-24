ARG KERNEL_VERSION

FROM linuxkit/kernel:${KERNEL_VERSION} as ksrc
FROM ubuntu:22.04 AS build

ARG BPFTRACE_VERSION

SHELL ["/bin/bash", "-c"]

WORKDIR /kernel
COPY --from=ksrc /kernel-dev.tar .
RUN tar xf kernel-dev.tar

WORKDIR /work
RUN apt-get update && apt-get install -y \
    wget vim tmux git binutils unzip bpftrace lsb-release gnupg curl && \
    mkdir -p /playground/tetris && \
    wget https://github.com/iovisor/bpftrace/archive/${BPFTRACE_VERSION}.zip && \
    unzip ${BPFTRACE_VERSION}.zip && \
    cp -r bpftrace*/tools /playground/ && \
    git clone https://github.com/mmisono/bpftrace-tetris --depth=1 && \
    cp bpftrace-tetris/tetris.bt /playground/tetris/ && \
    mv /kernel/usr/src/linux-headers* /kernel/usr/src/linux-headers

RUN echo -e "deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse \n\
deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse \n\
deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse" \n\
> /etc/apt/sources.list.d/ddebs.list && \
    apt install ubuntu-dbgsym-keyring && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F2EDC64DC5AEE1F6B9C621F0C8CAB6595FDFF622 && \
    apt update && \
    apt install bpftrace-dbgsym

RUN curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
    apt update && \
    apt install -y kubectl

ENV BPFTRACE_KERNEL_SOURCE=/kernel/usr/src/linux-headers

COPY setup.sh .
COPY tetris_run.sh /playground/tetris/run.sh
RUN chmod +x /playground/tetris/run.sh

ENTRYPOINT ["/bin/sh", "/work/setup.sh"]

