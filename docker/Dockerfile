ARG KERNEL_VERSION

FROM linuxkit/kernel:${KERNEL_VERSION} as ksrc
FROM ubuntu:20.04 AS build

ARG BPFTRACE_VERSION

WORKDIR /kernel
COPY --from=ksrc /kernel-dev.tar .
RUN tar xf kernel-dev.tar

WORKDIR /work
RUN apt-get update && apt-get install -y \
    wget vim tmux git binutils unzip && \
    wget https://github.com/iovisor/bpftrace/releases/download/${BPFTRACE_VERSION}/bpftrace && \
    chmod +x bpftrace && \
    mv bpftrace /bin && \
    mkdir -p /playground/tetris && \
    wget https://github.com/iovisor/bpftrace/archive/${BPFTRACE_VERSION}.zip && \
    unzip ${BPFTRACE_VERSION}.zip && \
    cp -r bpftrace*/tools /playground/ && \
    git clone https://github.com/mmisono/bpftrace-tetris --depth=1 && \
    cp bpftrace-tetris/tetris.bt /playground/tetris/ && \
    mv /kernel/usr/src/linux-headers* /kernel/usr/src/linux-headers

ENV BPFTRACE_KERNEL_SOURCE=/kernel/usr/src/linux-headers

COPY setup.sh .
COPY tetris_run.sh /playground/tetris/run.sh
RUN chmod +x /playground/tetris/run.sh

ENTRYPOINT ["/bin/sh", "/work/setup.sh"]

