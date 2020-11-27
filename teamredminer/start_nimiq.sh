#!/bin/sh

# Example batch file for starting teamredminer.  Please fill in all <fields> with the correct values for you.
# Format for running miner:
#      teamredminer.exe -a <algo> -o stratum+tcp://<pool address>:<pool port> -u <pool username/wallet> -p <pool password>
#
# Fields:
#      algo - the name of the algorithm to run. E.g. lyra2z, phi2, or cnv8
#      pool address - the host name of the pool stratum or it's IP address. E.g. lux.pickaxe.pro
#      pool port - the port of the pool's stratum to connect to.  E.g. 8332
#      pool username/wallet - For most pools, this is the wallet address you want to mine to.  Some pools require a username
#      pool password - For most pools this can be empty.  For pools using usernames, you may need to provide a password as configured on the pool.
#      worker name - use --nimiq_worker=myrig

# NOTE NOTE NOTE
# The pool used below is routed through a local network proxy that is now integrated into the miner.
# You can also run this proxy yourself. See the NIMIQ_MINING.txt for more info.

# Example:
./teamredminer -a nimiq -o stratum+tcp://nimiq.icemining.ca:2053 -u "NQ84 9DX6 R80G TSAE 2TJL 9PSR 1E55 A8YN C5CM" -p x --nimiq_worker=trm_test
