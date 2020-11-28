#!/bin/sh

# Trivial watchdog example script for TeamRedMiner that issues a
# standard reboot command. Activate support by passing
# "--watchdog_script" as an additional miner argument.
#
# NOTE 1: you must run the miner as root for the reboot to be
# executed.
#
# NOTE 2: some rigs and driver versions get hard hangs that fail to
# reboot with the standard reboot command in this script. If so,
# switch to using the sysrq-based watchdog script by passing
# "--watchdog_script=watchdog_sysrq.sh" to the miner instead.

/sbin/reboot

