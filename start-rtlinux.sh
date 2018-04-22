#!/bin/bash
renice -20 `ps -ef | grep sdm | egrep -v grep | awk '{print $2}'`
chrt -a -p 99 `ps -ef | grep sdm | egrep -v grep | awk '{print $2}' `
echo 0 > /proc/sys/kernel/hung_task_timeout_secs
cat /sys/devices/system/cpu/cpufreq/policy1/scaling_max_freq  >> /sys/devices/system/cpu/cpufreq/policy1/scaling_min_freq
cat /sys/devices/system/cpu/cpufreq/policy1/scaling_max_freq  >> /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
echo 0 > /dev/cpu_dma_latency
echo 2900000  >> /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo 2900000  >> /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
echo 2900000  >> /sys/devices/system/cpu/cpufreq/policy1/scaling_max_freq
echo 2900000  >> /sys/devices/system/cpu/cpufreq/policy1/scaling_min_freq
printf %x $((2**4-2)) | egrep -v 122 | egrep -v 123|egrep -v 124|egrep -v 125|egrep -v 126|egrep -v 127|egrep -v 128|egrep -v 129|egrep -v 130|egrep -v 131|egrep -v 132|egrep -v 134|egrep -v 134|egrep -v 135|egrep -v 136|egrep -v 137|  sudo tee /proc/irq/*/smp_affinity
echo 1 > /proc/irq/120/smp_affinity_list
echo 1 > /proc/irq/121/smp_affinity_list 
echo 1 > /proc/irq/122/smp_affinity_list
echo 1 > /proc/irq/123/smp_affinity_list
echo 1 > /proc/irq/124/smp_affinity_list
echo 1 > /proc/irq/125/smp_affinity_list
echo 1 > /proc/irq/126/smp_affinity_list
echo 1 > /proc/irq/127/smp_affinity_list
echo 1 > /proc/irq/128/smp_affinity_list
echo 1 > /proc/irq/129/smp_affinity_list
echo 1 > /proc/irq/130/smp_affinity_list
echo 1 > /proc/irq/131/smp_affinity_list
echo 1 > /proc/irq/132/smp_affinity_list
echo 1 > /proc/irq/133/smp_affinity_list
echo 1 > /proc/irq/134/smp_affinity_list
echo 1 > /proc/irq/135/smp_affinity_list

#amdgpu(s)
echo 2 > /proc/irq/136/smp_affinity_list
echo 2 > /proc/irq/137/smp_affinity_list
echo 2 > /proc/irq/138/smp_affinity_list
echo 2 > /proc/irq/139/smp_affinity_list
echo 2 > /proc/irq/140/smp_affinity_list
echo 2 > /proc/irq/141/smp_affinity_list

