#!/bin/bash
#Here is the example for the dreaded pirate roberts 570 samsung nitro's

rocm-smi --device 2 --setmclk 2
rocm-smi --device 1 --setmclk 2
rocm-smi --device 0 --setmclk 2
rocm-smi --device 2 --setsclk 7
rocm-smi --device 1 --setsclk 7
rocm-smi --device 0 --setsclk 7
rocm-smi --setfan 133 
rocm-smi --device 2 --setoverdrive 7 --autorespond yes
rocm-smi --device 0 --setoverdrive 7 --autorespond yes
rocm-smi --device 1 --setoverdrive 7 --autorespond yes
echo high > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card1/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card2/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card3/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card4/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card5/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card6/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card7/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card8/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card9/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card10/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card11/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card12/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card13/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card14/device/power_dpm_force_performance_level
echo high > /sys/class/drm/card15/device/power_dpm_force_performance_level
#amdcovc memclk:2=2250
#amdcovc memclk:1=2250
#amdcovc memclk:0=2250
#amdcovc memclk:0=2250
#amdcovc memclk:1=2250
#amdcovc memclk:2=2250

