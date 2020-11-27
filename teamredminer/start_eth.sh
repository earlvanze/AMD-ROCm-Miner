#!/bin/sh

# These environment variables should be set to for the driver to allow max mem allocation from the gpu(s).
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1

# Example batch file for starting teamredminer.  Please fill in all <fields> with the correct values for you.
# Format for running miner:
#      teamredminer.exe -a <algo> -o stratum+tcp://<pool address>:<pool port> -u <pool username/wallet> -p <pool password>
#
# Fields:
#      algo - the name of the algorithm to run. E.g. x16r or x16rv2
#      pool address - the host name of the pool stratum or it's IP address. E.g. lux.pickaxe.pro
#      pool port - the port of the pool's stratum to connect to.  E.g. 8332
#      pool username/wallet - For most pools, this is the wallet address you want to mine to.  Some pools require a username
#      pool password - For most pools this can be empty.  For pools using usernames, you may need to provide a password as configured on the pool.
#
# Example steps:
# 1. If you prefer a different pool, change the pool server address.
#
# 2. Replace the example wallet with your own wallet(!).
#
# 3. Name your worker by changing "trmtest" to your name of choice after the wallet below.
#
# 4. You're good to go!

./teamredminer -a ethash -o stratum+tcp://eu1.ethermine.org:4444 -u 0x02197021fefa795fec661a45f60e47a6f6605281.trmtest -p x

