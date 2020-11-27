#!/bin/sh

# For more information about individual options, plesae read the --help output.

# Multiple pools can be configured for TeamRedMiner using multiple instances of the -o (--url) option.
# Each occurance of the -o option starts a new pool config.  Each of the pool config fields must be
# defined for each instance of a pool, such as the -u option.  TeamRedMiner supports multiple pool
# strategies, but by default it will do basic failover.  For other strategies read the --help for
# the --pool_strategy option.

# A typical command line for mutliple pools will look like the following:
# ./teamredminer -a <algo> (add other global/algo options here) -o <pool1_url> -u <pool1_username> -o <pool2_url> -u <pool2_username> -o <pool3_url> -u <pool3_username> ...

# Here is an example:
./teamredminer -a ethash \
    -o stratum+tcp://eu1.ethermine.org:4444 -u 0x02197021fefa795fec661a45f60e47a6f6605281.trmtest -p x \
    -o stratum+tcp://eth-eu2.nanopool.org:9999 -u 0x02197021fefa795fec661a45f60e47a6f6605281.trmtest -p x


