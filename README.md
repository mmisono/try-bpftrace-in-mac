Try bpftrace in macOS
=====================

## How to Use

1. Install Docker Desktop for Mac
2. ./build.sh
    Ideally check the version of bpftrace included in the ubuntu distribution and run the build with the same version for the compatibility of the tools
```
# BPFTRACE_VERSION=v0.14.0 ./build.sh
```
3. ./run.sh
    Docker arguments can be passed like this
```
# ./run.sh  -v /Users/home:/Users/home -e KUBECONFIG=${KUBECONFIG}
```
4. Enjoy!

![demo](https://user-images.githubusercontent.com/186170/99377060-1b09be80-2909-11eb-8c73-e9064dfc7f15.gif)


## FAQ

### Why does it run on macOS?
- The Docker for mac runs Linux on a hypervisor called hyperkit, and docker runs inside it, so you can use Linux features.

### Can we trace host (macOS) with this?
- No. The bpftrace run in a Linux VM. For macOS, there is dtrace.
