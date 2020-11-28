# NiceHash DaggerHashimoto (Ethash) Miner using TeamRedMiner
killall teamredminer
./teamredminer -a ethash --eth_variant_mode=auto -o stratum+tcp://1.2.3.4:8008 -u 3NktvtucrCFRDdNi8aHiA9ozpYDnKZxDkJ.Rig2 -p x \
--init_style=3
#--eth_stratum_mode=stratum
#--api_listen=0.0.0.0:3333

# NiceHash DaggerHashimoto (Ethash) Miner using Phoenix (configured in start-rtminer.sh)
#killall PhoenixMiner
#nohup taskset -c 1 /rootr/PhoenixMiner/PhoenixMiner -pool 1.2.3.4:8008 -wal 3NktvtucrCFRDdNi8aHiA9ozpYDnKZxDkJ.Rig1 -pass x \
#-log 0 -retrydelay 1 -ftime 55 -tt 65 -tstop 75 -tstart 55 -fanmin 50 -fanmax 85 \
#-Rmode 1 -proto 4 -stales 0 -fret 1 -rate 1 &

# NiceHash DaggerHashimoto (Ethash) Miner using Claymore (configured in start-rtminer.sh)
#killall ethdcrminer64
#nohup taskset -c 1 /rootr/Claymore/ethdcrminer64 -epool 1.2.3.4:8008 -ewal 3NktvtucrCFRDdNi8aHiA9ozpYDnKZxDkJ.Rig1 -epsw x \
#-asm 1 -esm 3 -allpools 1 -estale 0 -wd 0 -r 60 -logsmaxsize 0 -minspeed 200 \
#-ftime 10 -tstop 75 -tstart 55 -tt 65 -ttli 70 -fanmin 50 -fanmax 85 \
#-mport -3001 &

# MiningPoolHub ZCL Miner
#killall miner
#nohup taskset -c 1 /rootr/gminer/miner --algo 192_7 --pers ZcashPoW --server us-east.equihash-hub.miningpoolhub.com --port 20574 \
#--user digitalkid23.denizen --pass x \
#--api 3002 --electricity_cost 0.136 -w 0 -t 80 &

#killall lolMiner
#nohup taskset -c 1 /rootr/lolMiner/lolMiner --coin AUTO192_7 --pool us-east.equihash-hub.miningpoolhub.com --port 20574 --user digitalkid23.denizen &

#killall zecminer64
#nohup taskset -c 1 /rootr/Claymore_ZCL/zecminer64 -zpool us-east.equihash-hub.miningpoolhub.com:20574 -zwal digitalkid23.denizen -zpsw x \
#-asm 1 -i 8 -wd 0 -r 60 -allpools 1 \
#-ftime 10 -tstop 85 -tt 60 -ttli 75 -fanmin 50 -fanmax 85 \
#-mport -3002 &

# Ethermine.org ETH Miner
#killall ethdcrminer64
#nohup taskset -c 1 /rootr/Claymore/ethdcrminer64 -epool local.ethermine.org:8008 -ewal 0x9eaba219ac4ac28c2c008b3d9968cdbb7c5250f0.rig2 -epsw x \
#-asm 1 -ethi 8 -wd 0 -r 60 -logsmaxsize 0 \
#-ftime 10 -tstop 85 -tstart 55 -tt 60 -ttli 75 -fanmin 50 -fanmax 85 \
#-mport -3002 &

# Extra Claymore Flags
# Removed dual mining SC because SC is now mined with ASICs - low throughput and causes higher electricity and temperature
#-dcoin sia -dpool stratum+tcp://us-east.siamining.com:7777 -dwal de1caac41616a762428a2c2baca667bde5fb27ff6b0717bb0d2c1b3493a3f972933524ef9d19.rig2 -dpsw x \
