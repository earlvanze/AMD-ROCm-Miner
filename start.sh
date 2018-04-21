#!/bin/bash
cd /root
/root/start-net.sh&

PATH=$PATH:/opt/rocm/bin

cat /etc/modprobe.d/blacklist.conf | grep blacklist | sed s/blacklist//g  | xargs rmmod 

export GPU_MAX_ALLOC_PERCENT=100
export GPU_FORCE_64BIT_PT=1 
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

cd /root
/root/start-rtlinux.sh&

cd /root
/root/start-oc.sh

cd /root/QuantumRNG
while sleep 600; do /root/QuantumRNG/pollinate; done&

cd /root/Claymore
/root/start-rtminer.sh&
