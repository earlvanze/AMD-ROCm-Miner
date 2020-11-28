#!/bin/sh

# Sysrq-based watchdog example script for TeamRedMiner. This script
# issues a hard form of reboot through the linux sysrq subsystem. The
# kernel must have support for sysrq to begin with, but that is
# normally the case.
#
# NOTE: the miner must be run as root for the watchdog script to work
# correctly.

# Activate sysrq
echo "1" > /proc/sys/kernel/sysrq

# Sync disks
echo "s" > /proc/sysrq-trigger
/bin/sleep 1

# Remount all disks read-only.
echo "u" > /proc/sysrq-trigger
/bin/sleep 1

# Issue the hard reboot command.
echo "b" > /proc/sysrq-trigger
