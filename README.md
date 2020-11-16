Try bpftrace in macOS
=====================

## How to Use

1. Install Docker Desktop for Mac
2. ./build.sh
3. ./run.sh
4. Enjoy!

## FAQ

### Why does it run on macOS?
- The Docker for mac runs Linux on a hypervisor called hyperkit, and docker runs inside it, so you can use Linux features.

### Can we trace host (macOS) with this?
- No. The bpftrace run in a Linux VM. For macOS, there is dtrace.
