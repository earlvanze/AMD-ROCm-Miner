# AMD-rocm-rippa Version 2 Fork
Dev userland for usb flash drive with full amd rocm and blockchain support.

Kudos to Tekcomm for creating the original image. I forked it to archive my modifications, mostly in /root but also with the kernel update to solve the kernel panics in the original 4.13 image.
Deleted the amdgpu-pro driver installation files to save 1.1 GB of space but since upgrading kernel to 4.16.3+ I can no longer fit it on an 8 GB drive without deleting other things that I may not need anyway. Feel free to slim it down further yourself.
(https://github.com/tekcomm/AMD-rocm-rippa)

This is alpha software. You agree to the user license by clicking on the video:
https://www.youtube.com/watch?v=_3Cl43FZvZc&feature=youtu.be

Beta Version is here:
https://github.com/RadeonOpenCompute/ROCm/issues/345

Version 2 is here:
https://github.com/RadeonOpenCompute/ROCm/issues/361

I uploaded a <a href="https://drive.google.com/open?id=1iel3XKQtI0Z-HPDELonKDxF4gaEYYWDb">working image with 4.16.3+ kernel</a> and password reset to "cryptominer" (for both guru and root users). If you can't log in still, chroot into the image and type passwd to change the root password.
Download the 16 GB image and dd to a 16 GB or larger USB flash drive (download dd Utility on Mac or WinDD on Windows). Plug and chug. 8.1 out of 15.5 GB space used.
```
Username: guru
Password: cryptominer
```
gparted can expand your partition to fill up a drive larger than 16 GB.
This link works better than the one on MEGA because MEGA has a 5 GB free transfer limit. It took me 12 hours to get the whole image.
Or you could just email tekcommnv@gmail.com and he could send it to you.

Don't forget to change the address and mining pool in /root/start-rtminer.sh and /root/Claymore/stratum_proxy.py. Or don't, I'll take the extra hashrate :)

start-oc.sh was modified to work with my actual GPUs. Follow the instructions and use pattern recognition to figure it out.

start-rtlinux.sh was modified from the original image to work on Intel Celeron dual-core CPUs.
Note that PCIe Gen3 does not work on Celeron or Pentium CPUs. Your motherboard must be set to PCIe Gen1 or Gen2.
If you're using risers, you will not be able to take advantage of PCIe Atomics. Set your motherboard to PCIe Gen 1.

In Linux, plug in USB or mount image:
```
mount -t ext4 -o loop,offset=[(block # of /dev/sdb3) * 512 (block size in bytes)] cryptominer-16gb.img /mountpoint
```
Also mount other folders:
```
for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i /mountpoint$i; done
```
Then cd into root folder of img and chroot:
```
cd /mountpoint
sudo chroot .
```
Then you can update files, passwd, etc.

I can't get Realtek r8168 module or Broadcom wl wireless module to install for whatever reason, which my test machine with an MSI Z270-A Pro uses. It does work seamlessly with the Intel Ethernet card in the ASUS Z270-A Prime boards though. I have 3 of those rigs running this image.
I'll figure out how to get my test mobo to work or swap it out for a Z270-A Prime at some point.

## Support for Radeon Open Compute
https://github.com/RadeonOpenCompute/ROCm

The ROCm Platform brings a rich foundation to advanced computing by seamlessly
 integrating the CPU and GPU with the goal of solving real-world problems.

#### Supported CPUs
The ROCm Platform leverages PCIe Atomics (Fetch ADD, Compare and SWAP, 
Unconditional SWAP, AtomicsOpCompletion).
[PCIe atomics](https://github.com/RadeonOpenCompute/RadeonOpenCompute.github.io/blob/master/ROCmPCIeFeatures.md)
are only supported on PCIe Gen3 Enabled CPUs and PCIe Gen3 Switches like
Broadcom PLX. When you install your GPUs make sure you install them in a fully
PCIe Gen3 x16 or x8 slot attached either directly to the CPU's Root I/O 
controller or via a PCIe switch directly attached to the CPU's Root I/O 
controller. In our experience many issues stem from trying to use consumer 
motherboards which provide Physical x16 Connectors that are electrically 
connected as e.g. PCIe Gen2 x4. This typically occurs when connecting via the 
Southbridge PCIe I/O controller. If you motherboard is part of this category,
please do not use this connector for your GPUs, if you intend to exploit ROCm.


Our GFX8 GPU's (Fiji & Polaris Family) and GFX9 (Vega)  use PCIe Gen 3 and PCIe Atomics. 

Current CPUs which support PCIe Gen3 + PCIe Atomics are: 
  * Intel Xeon E5 v3 or newer CPUs; 
  * Intel Xeon E3 v3 or newer CPUs; 
  * Intel Core i7 v4, Core i5 v4, Core i3 v4 or newer CPUs (i.e. Haswell family or newer).
  * AMD Ryzen CPUs;
  
Upcoming CPUs which will support PCIe Gen3 + PCIe Atomics are:
  * AMD Naples Server CPUs; 
  * Cavium Thunder X Server Processor. 

Experimental support for our GFX7 GPUs Radeon R9 290, R9 390, AMD FirePro S9150, S9170 note they do not support or
take advantage of PCIe Atomics. However, we still recommend that you use a CPU
from the list provided above. 

#### Not supported or very limited support under ROCm 
* We do not support ROCm with PCIe Gen 2 enabled CPUs such as the AMD Opteron,
Phenom, Phenom II, Athlon, Athlon X2, Athlon II and Older Intel Xeon and Intel
Core Architecture and Pentium CPUs.  
* We also do not support AMD Carrizo and Kaveri APU as host for compliant dGPU
 attachments.
* Thunderbolt 1 and 2 enabled GPU's are not supported by ROCm. Thunderbolt 1 & 2
are PCIe Gen2 based.
* AMD Carrizo based APUs have limited support due to OEM & ODM's choices when it
comes to some key configuration parameters. On point, we have observed that
Carrizo Laptops, AIOs and Desktop systems showed inconsistencies in exposing and
enabling the System BIOS parameters required by the ROCm stack. Before
purchasing a Carrizo system for ROCm, please verify that the BIOS provides an
option for enabling IOMMUv2. If this is the case, the final requirement is
associated with correct CRAT table support - please inquire with the OEM about 
the latter.
* AMD Merlin/Falcon Embedded System is also not currently supported by the public Repo. 
* AMD Raven Ridge APU are currently not supported 
