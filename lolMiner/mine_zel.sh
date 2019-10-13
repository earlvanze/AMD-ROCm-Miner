#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=stratum.zel.cash
PORT=2001
WALLET=t1cLkQpx3kEJw2TjPnTmCpe4KqLvER8NknA.testWorker	

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --coin ZEL --pool $POOL --port $PORT --user $WALLET $@
