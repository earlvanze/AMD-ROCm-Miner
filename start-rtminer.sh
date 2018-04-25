#!/bin/bash
killall python
killall ethdcrminer64
killall FAHClient ; killall FAHClient ;killall FAHClient
find /root/fah | grep log| grep txt | xargs rm
find /var/log/ | xargs -r rm
/etc/init.d/ssh start
cp -r /root/fah/* /root/fahtmpfs
cd /root/fahtmpfs
mount -o bind,ro /root /rootr
nohup taskset -c 1 /root/fahtmpfs/FAHClient &
cd /rootr
nohup python /rootr/Claymore/stratum_proxy.py --local-host 1.2.3.4 --local-port 8008 --remote-host us1.ethermine.org --remote-port 4444 --wallet-address 0x9eaba219ac4ac28c2c008b3d9968cdbb7c5250f0 & 
cd /rootr/Claymore
nohup taskset -c 0 /rootr/Claymore/ethdcrminer64 -epool local.ethermine.org:8008 -ewal 0x9eaba219ac4ac28c2c008b3d9968cdbb7c5250f0.rig1 -epsw x \
-dcoin sia -dpool stratum+tcp://us-east.siamining.com:7777 -dwal de1caac41616a762428a2c2baca667bde5fb27ff6b0717bb0d2c1b3493a3f972933524ef9d19.rig1 -dpsw x \
-asm 1 -dcri 17 -ethi 16 -wd 0 -erate 0 -logsmaxsize 0 \
-ftime 10 -tstop 85 -tt 55 -fanmin 50 -fanmax 80 \
-cclock 1100 -mclock 2200 -cvddc 900 -mvddc 900 &
echo 100 > echo  /proc/`ps -aux | grep ethdcrminer64 |egrep -v grep | awk '{print $2}'`/timerslack_ns
renice -20 `ps -ef | grep amd | egrep -v grep | awk '{print $2}'`
renice -20 `ps -ef | grep eth | egrep -v grep | awk '{print $2}'`
renice -20 `ps -ef | grep rcu |  egrep -v grep | awk '{print $2}' `
chrt -a -p 99  `ps -ef | grep rcu | egrep -v grep | awk '{print $2}' `
chrt -a -p 99 `ps -ef | grep amd | egrep -v grep | awk '{print $2}' `
chrt -a -p 99 `ps -ef | grep eth | egrep -v grep | awk '{print $2}' `
chrt -a -p 99 `ps -ef | grep python | egrep -v grep | awk '{print $2}'`
while sleep 3580; do  cp -r /root/fahtmpfs/* /root/fah/; done&
while sleep 3611; do reboot; done&
