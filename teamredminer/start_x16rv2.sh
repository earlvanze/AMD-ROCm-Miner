#!/bin/sh

# Example batch file for starting teamredminer.  Please fill in all <fields> with the correct values for you.
# Format for running miner:
#      teamredminer.exe -a <algo> -o stratum+tcp://<pool address>:<pool port> -u <pool username/wallet> -p <pool password>
#
# Fields:
#      algo - the name of the algorithm to run. E.g. x16r or x16rv2
#      pool address - the host name of the pool stratum or it's IP address. E.g. us.rvn.minermore.com or stratum.ravenminer.com
#      pool port - the port of the pool's stratum to connect to.  E.g. 4501
#      pool username/wallet - For most pools, this is the wallet address you want to mine to.  Some pools require a username
#      pool password - For most pools this can be empty.  For pools using usernames, you may need to provide a password as configured on the pool.
#
# Example steps:
# 1. Depending on your location, you might want to change the stratum server below to:
#      US East: east.us.rvn.minermore.com 
#      US West: west.us.rvn.minermore.com 
#      Europe:  eu.rvn.minermore.com 
#      Asia:    hk.rvn.minermore.com
#      Canada:  ca.rvn.minermore.com
#
# 2. Replace the example wallet with your own wallet(!).
#
# 3. Name your worker by changing "trmtest" to your name of choice after the wallet below.
#
# 4. You're good to go!

# NOTE: this command line will not be valid before the Ravencoin fork to x16rv2 at 2019-10-01 16:00 UTC.
./teamredminer -a x16rv2 -o stratum+tcp://us.rvn.minermore.com:4501 -u RDpPHx43bhrmdyd8L6BcpkHtjuc1vMpNSk.trmtest -p x

# If you want to mine Pexa coin instead of Ravencoin, uncomment and use this line instead:
#./teamredminer -a x16rv2 -o stratum+tcp://pexa.minermore.com:4553 -u XEWamKh4G32cEiu81At84gG9gg59WPetNR.trmtest -p x
