#!/bin/sh

# Example batch file for starting teamredminer.  Please fill in all <fields> with the correct values for you.
# Format for running miner:
#      teamredminer.exe -a <algo> -o stratum+tcp://<pool address>:<pool port> -u <pool username/wallet> -p <pool password>
#
# Fields:
#      algo - the name of the algorithm to run. E.g. lyra2z or phi2
#      pool address - the host name of the pool stratum or it's IP address. E.g. lux.pickaxe.pro
#      pool port - the port of the pool's stratum to connect to.  E.g. 8332
#      pool username/wallet - For most pools, this is the wallet address you want to mine to.  Some pools require a username
#      pool password - For most pools this can be empty.  For pools using usernames, you may need to provide a password as configured on the pool.
#
# Example:
./teamredminer -a phi2 -o stratum+tcp://eu.bsod.pw:6667 -u LhreQGewLdoGFiqq882Am6i644Qc1h28Wh -p x
