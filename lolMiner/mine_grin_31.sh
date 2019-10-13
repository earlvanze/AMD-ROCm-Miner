#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eu.stratum.grin-pool.org
PORT=3416
WALLET=Lolliedieb
PASS=x

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --coin GRIN-AT31 --pool $POOL --port $PORT --user $WALLET --pass $PASS $@
