killall ethdcrminer64
nohup taskset -c 1 /rootr/Claymore/ethdcrminer64 -epool local.ethermine.org:8008 -ewal 0x9eaba219ac4ac28c2c008b3d9968cdbb7c5250f0.rig2 -epsw x \
-asm 1 -ethi 8 -wd 0 -r 60 -logsmaxsize 0 \
-ftime 10 -tstop 85 -tstart 55 -tt 60 -ttli 75 -fanmin 50 -fanmax 85 \
-mport -3002 &

#-cclock 1100 -cvddc 900 \
#-mclock 2200 -mvddc 900 \
# Removed dual mining SC because SC is now mined with ASICs - low throughput and causes higher electricity and temperature
#-dcoin sia -dpool stratum+tcp://us-east.siamining.com:7777 -dwal de1caac41616a762428a2c2baca667bde5fb27ff6b0717bb0d2c1b3493a3f972933524ef9d19.rig2 -dpsw x \
