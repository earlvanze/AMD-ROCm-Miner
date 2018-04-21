wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.12/linux-headers-4.15.12-041512_4.15.12-041512.201803211230_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.12/linux-headers-4.15.12-041512-generic_4.15.12-041512.201803211230_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.12/linux-image-4.15.12-041512-generic_4.15.12-041512.201803211230_amd64.deb
dpkg -i linux-image-4.15.12-041512-generic_4.15.12-041512.201803211230_amd64.deb linux-headers-4.15.12-041512-generic_4.15.12-041512.201803211230_amd64.deb linux-headers-4.15.12-041512_4.15.12-041512.201803211230_all.deb
sed -i s/GRUB_CMDLINE/#GRUB_CMDLINE/g /etc/default/grub
echo GRUB_CMDLINE_LINUX_DEFAULT="init=/lib/sysvinit/init selinux=0 amdgpu.vm_fragment_size=9  nmi_watchdog=0 3 pti=off spectre_v2=off amdgpu.hw_i2c=1 isolcpus=5,6,7 nohz_full=5,6,7 processor.max_cstate=1 intel_pstate=disable audit=0 clocksource=hpet thermal.off=1 vga=0" >> /etc/default/grub


