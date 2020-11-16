#!/bin/sh

SCRIPTDIR=`dirname $0`

stty -echo
BPFTRACE_STRLEN=10 bpftrace $SCRIPTDIR/tetris.bt 2>/dev/null
stty echo



