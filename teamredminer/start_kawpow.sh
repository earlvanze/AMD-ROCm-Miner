#!/bin/sh

# Example batch file for starting teamredminer.  Please fill in all <fields> with the correct values for you.
# Format for running miner:
#      ./teamredminer -a <algo> -o stratum+tcp://<pool address>:<pool port> -u <pool username/wallet> -p <pool password>
#
# Fields:
#      algo - the name of the algorithm to run. E.g. kawpow 
#      pool address - the host name of the pool stratum or it's IP address. E.g. rvn.woolypooly.com
#      pool port - the port of the pool's stratum to connect to.  E.g. 55555
#      pool username/wallet - For most pools, this is the wallet address you want to mine to.  Some pools require a username
#      pool password - For most pools this can be empty.  For pools using usernames, you may need to provide a password as configured on the pool.
#
# Example steps:
# 1. Change the pool address and port to your favorite pool.
#
# 2. Replace the example wallet with your own wallet(!).
#
# 3. Name your worker by changing "trmtest" to your name of choice after the wallet below.
#
# 4. You're good to go!

./teamredminer -a kawpow -o stratum+tcp://rvn.woolypooly.com:55555 -u RDpPHx43bhrmdyd8L6BcpkHtjuc1vMpNSk.trmtest -p x

