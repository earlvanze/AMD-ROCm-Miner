#!/bin/bash
cd /root
/root/start-net.sh&

PATH=$PATH:/opt/rocm/bin

# Only needed to run once to remove modules in the blacklist for a slim kernel
# Not needed for pre-created image, only needed if you're building your own slim image
# cat /etc/modprobe.d/blacklist.conf | grep blacklist | sed s/blacklist//g  | xargs rmmod

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

cd /root
/root/start-rtminer.sh&

#cd /root/oclvanityminer
#/root/oclvanityminer/Startwork &

#inotifywait -m /root/oclvanityminer -e create -e moved_to |
#    while read path action file; do
#        echo "The file '$file' appeared in directory '$path' via '$action'"
#        # do something with the file
#    done&
