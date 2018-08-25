# AMD GPU Blockchain Miner Linux Image
Ubuntu 16.04 developer userland for usb flash drives with full AMD ROCm and blockchain support.

This repository is used to archive my modifications in /root. The kernel is updated to <a href="https://github.com/M-Bab/linux-kernel-amdgpu-binaries">4.18.0 with M-Bab amdgpu kernels</a>.

7.6 GB out of 10GB used, 4GB linux-swap partition filling up the remaining space. Feel free to slim it down further yourself and adjust in gparted as needed.


# MIT License and Disclaimer
This is developer software in continuous development. While I use it in production, I do not take any responsibility for any damage that may occur to your hardware, software, or infrastructure. There are other developers involved in creating this bootable Linux disk image and they cannot be held responsible either. By using this software, you agree to the following MIT License:

Copyright 2018 Earl Co

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


# How to Use

I uploaded a <a href="https://drive.google.com/open?id=1iel3XKQtI0Z-HPDELonKDxF4gaEYYWDb">working image with 4.18.0 kernel</a> and password reset to "cryptominer" (for both guru and root users). If you can't log in still, chroot into the image and type passwd to change the root password.
Download the 15.52 GB image and dd to a 15.52 GB or larger USB flash drive (download dd Utility on Mac or WinDD on Windows). Plug and chug. Note that this real-time operating system is modified to disable keyboard interrupts, so you cannot use your keyboard once it starts booting. The display output only shows ```dmesg``` logs. The CLI is accessible via SSH.
```
Username: guru
Password: cryptominer
```
gparted can expand your partitions to fill up a drive larger than 16 GB.

At boot, /etc/rc.local calls start.sh which calls start-rtminer.sh. This is the script that determines which miner will be used. tdxminer for Lyra2z, xmr-stak for Cryptonightv7 and other algorithms, and Claymore dual miner for Ethereum, Ethereum Classic, SiaCoin, Decred, Pascal, and others are provided. sgminer is also available. Feel free to install whatever mining software you want to use.

If you're using Claymore Ethereum miner, don't forget to change the address and mining pool in /root/start-rtminer.sh and /root/Claymore/stratum_proxy.py. The proxy is used to reduce stale shares. Feel free to contribute extra hashes :)

start-oc.sh was modified to work with my actual GPUs. Overclocking and underclocking at boot is done here. Follow the instructions and use pattern recognition to figure it out.

start-rtlinux.sh was modified from the original image to work on Intel Celeron dual-core CPUs.
Note that PCIe Gen3 does not work on Celeron or Pentium CPUs. Your motherboard must be set to PCIe Gen1 or Gen2.
If you're using risers, you will not be able to take advantage of PCIe Atomics. Set your motherboard to PCIe Gen 1.

In Linux, plug in USB or mount image:
```
mount -t ext4 -o loop,offset=316669952 /path/to/image [/media/root or whatever your mount point is]
```
To <a href="https://www.linuxquestions.org/questions/linux-general-1/how-to-mount-img-file-882386/">determine the offset for your image or drive</a>, run:
```
fdisk -l /path/to/image
```
Also mount other folders:
```
for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i /media/root$i; done
```
Then cd into root folder of img and chroot:
```
cd /media/root
sudo chroot .
```
Then you can update files, passwd, etc.

Other graphical development versions such as <a href="https://drive.google.com/file/d/1Ru-3-OVeqPZ54TVk3mn9HtWlQ2VWmxyE/view">V5</a> are provided and linked here:
https://github.com/RadeonOpenCompute/ROCm/issues/361

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


## Donate

If you like this program, please donate using any of the methods below!


Square Cash	http://cash.me/$digitalkid<br>
Venmo	https://venmo.com/earlco<br>
PayPal	http://paypal.me/earlco<br>
Zelle	earlvanze@gmail.com<br>
BTC	12icq2NfvXDYExaH3a4FVnWJwerb1oj31Z<br>
ETH	0x234AD7D3225dC28f2B292cCBE05CdD321C4aCC5B<br>
ZEC	t1duLU96HyXQ7dGwdesZB6C4iCPe5HZw5ar<br>
LTC	LQymEUqGK9dBeugi2bNNtt4LEGpm6bMYjJ<br>
NEO/GAS	ALfeqEsmEexzk5RFGUZinedMAtjnfUz4f7<br>
SC	de1caac41616a762428a2c2baca667bde5fb27ff6b0717bb0d2c1b3493a3f972933524ef9d19


If you want me to build a version for YOUR region, please reach out by email: earlvanze@gmail.com
