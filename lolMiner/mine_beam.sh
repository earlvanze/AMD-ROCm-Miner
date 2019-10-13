#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=beam.sunpool.top
PORT=3334
WALLET=32f2e8765c2e8f5ea41becc5f397024c94d80cc5fc50ee917af23b260ecb3a5f.testRun

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --coin BEAM --pool $POOL --port $PORT --user $WALLET $@
