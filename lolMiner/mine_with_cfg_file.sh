#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

PROFILE=EXAMPLE_BEAM_SINGLE	

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --profile $PROFILE $@
