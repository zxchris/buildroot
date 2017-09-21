setenv bootm_boot_mode sec
setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_fb_mem_reserve=16 consoleblank=0 ${extra} mem=256M hdmi.audio=1 disp.screen0_output_mode=1280x720p50
ext4load mmc 0 0x43000000 /boot/script.bin
ext4load mmc 0 0x48000000 /boot/zImage
bootz 0x48000000
