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
nohup taskset -c 0 /root/fahtmpfs/FAHClient &	# temporarily disable to test oclvanityminer
cd /rootr
nohup python /rootr/Claymore/stratum_proxy.py --local-host 1.2.3.4 --local-port 8008 --remote-host us1.ethermine.org --remote-port 4444 --wallet-address 0x9eaba219ac4ac28c2c008b3d9968cdbb7c5250f0 & 
(while :; cd /rootr/Claymore; do /rootr/mine.sh; sleep 3611; done) &
#(while :; cd /rootr/tdxminer; do /rootr/tdxminer/go; sleep 3611; done) &
#(while :; cd /rootr/xmr-stak; do nohup taskset -c 1 /rootr/xmr-stak/xmr-stak; sleep 3611; done) &
echo 100 > echo  /proc/`ps -aux | grep ethdcrminer64 |egrep -v grep | awk '{print $2}'`/timerslack_ns
renice -20 `ps -ef | grep amd | egrep -v grep | awk '{print $2}'`
renice -20 `ps -ef | grep eth | egrep -v grep | awk '{print $2}'`
renice -20 `ps -ef | grep rcu |  egrep -v grep | awk '{print $2}' `
chrt -a -p 99  `ps -ef | grep rcu | egrep -v grep | awk '{print $2}' `
chrt -a -p 99 `ps -ef | grep amd | egrep -v grep | awk '{print $2}' `
chrt -a -p 99 `ps -ef | grep eth | egrep -v grep | awk '{print $2}' `
chrt -a -p 99 `ps -ef | grep python | egrep -v grep | awk '{print $2}'`
while :; do  cp -r /root/fahtmpfs/* /root/fah/; sleep 3580; done&
