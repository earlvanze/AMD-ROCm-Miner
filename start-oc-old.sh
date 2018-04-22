#!/bin/bash
#Here is the example for the dreaded pirate roberts 570 samsung nitro's

rocm-smi --device 5 --setmclk 2
rocm-smi --device 4 --setmclk 2
rocm-smi --device 3 --setmclk 2
rocm-smi --device 2 --setmclk 2
rocm-smi --device 1 --setmclk 2
rocm-smi --device 0 --setmclk 2
rocm-smi --device 5 --setsclk 7
rocm-smi --device 4 --setsclk 7
rocm-smi --device 3 --setsclk 7
rocm-smi --device 2 --setsclk 7
rocm-smi --device 1 --setsclk 7
rocm-smi --device 0 --setsclk 7
rocm-smi --setfan 133 
rocm-smi --device 5 --setoverdrive 20 --autorespond yes
rocm-smi --device 4 --setoverdrive 20 --autorespond yes
rocm-smi --device 3 --setoverdrive 20 --autorespond yes
rocm-smi --device 2 --setoverdrive 20 --autorespond yes
rocm-smi --device 1 --setoverdrive 20 --autorespond yes
rocm-smi --device 0 --setoverdrive 20 --autorespond yes
echo high > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card1/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card2/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card3/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card4/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card5/device/power_dpm_force_performance_level
#amdcovc memclk:2=2250
#amdcovc memclk:1=2250
#amdcovc memclk:0=2250
#amdcovc memclk:0=2250
#amdcovc memclk:1=2250
#amdcovc memclk:2=2250

