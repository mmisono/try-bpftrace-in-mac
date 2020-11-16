#!/bin/sh
mount -t debugfs none /sys/kernel/debug/
sysctl -w kernel.kptr_restrict=0 >/dev/null 2>&1
sysctl -w kernel.perf_event_paranoid=2 >/dev/null 2>&1
cd /playground/
/bin/bash
