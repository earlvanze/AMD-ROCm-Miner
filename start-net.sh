#!/bin/bash
cd /root
modprobe dummy
ifconfig dummy0 1.2.3.4 netmask 255.255.255.255 up
/etc/init.d/wicd stop
# configure static route
#export eth0=`dmesg | grep eth0 | grep rename | sed s/\:\ rename.*//g | sed s/.*:.*:.....//g`
#ifconfig $eth0 192.168.2.2 netmask 255.255.255.0 up
#route add default gw 192.168.2.1 
#ping -c 1 192.168.2.1
#modprobe cdc_ether
dhclient&
# $eth0&
