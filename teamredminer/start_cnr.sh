#!/bin/sh

# Example batch file for starting teamredminer.  Please fill in all <fields> with the correct values for you.
# Format for running miner:
#      teamredminer.exe -a <algo> -o stratum+tcp://<pool address>:<pool port> -u <pool username/wallet> -p <pool password> --cn_config <cn config>
#
# Fields:
#      algo - the name of the algorithm to run. E.g. lyra2z, phi2, or cnv8
#      pool address - the host name of the pool stratum or it's IP address. E.g. lux.pickaxe.pro
#      pool port - the port of the pool's stratum to connect to.  E.g. 8332
#      pool username/wallet - For most pools, this is the wallet address you want to mine to.  Some pools require a username
#      pool password - For most pools this can be empty.  For pools using usernames, you may need to provide a password as configured on the pool.
#      cn config - An optional thread intensity and mode to use for cryptonight mining.  See the --help option and CNV8_TUNING.txt for more info.

# These environment variables should be set to for the driver to allow max mem allocation from the gpu(s).
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1

# Example:
./teamredminer -a cnr -o stratum+tcp://pool.supportxmr.com:7777 -u 479c6JsyawEVAMNZU8GMmXgVPTxd1vdejR6vVpsm7z8y2AvP7C5hz2g5gfrqyffpvLPLYb2eUmmWA5yhRw5ANYyePX7SvLE -p x

