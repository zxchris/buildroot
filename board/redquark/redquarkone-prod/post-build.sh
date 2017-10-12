#!/bin/sh
# args from BR2_ROOTFS_POST_SCRIPT_ARGS
# $2    path of boot.cmd
# $3    output directory for boot.scr

MKIMAGE=$HOST_DIR/usr/bin/mkimage
$MKIMAGE -A arm -O linux -T script -C none -d $2 $3/boot.scr

BOARD_DIR="$(dirname $0)"

if [ -e $BINARIES_DIR/script.bin ]; then
	cp $BINARIES_DIR/script.bin $3/script.bin
fi

# Fixup rootfs /boot directory to contain additional post-NAND-u-boot boot files
cp ${BOARD_DIR}/boot/* ${TARGET_DIR}/boot/

# Create NAND boot partition filesystem archive and copy into the rootfs for extraction on the board
BOOT_FS_ARCHIVE=${BINARIES_DIR}/nand_boot.tgz
BOOT_FS_TMP=${BUILD_DIR}/_boot
if [ ! -d ${BOOT_FS_TMP} ]; then
    mkdir ${BOOT_FS_TMP}
fi
cp -r    ${BOARD_DIR}/nanda/*       ${BOOT_FS_TMP}
cp       ${BINARIES_DIR}/u-boot.bin ${BOOT_FS_TMP}/linux/
rm -f    ${BOOT_FS_ARCHIVE}
tar cvzf ${BOOT_FS_ARCHIVE} -C ${BOOT_FS_TMP} .
cp ${BOOT_FS_ARCHIVE} ${TARGET_DIR}/boot/


## Create NAND boot partition filesystem
#BOOT_FS_IMAGE=${BINARIES_DIR}/boot.msdos
#BOOT_FS_TMP=${BUILD_DIR}/_boot
#mkdir -d ${BOOT_FS_TMP}
#cp -r ${BOARD_DIR}/nanda/ ${BOOT_FS_TMP}
#cp    ${BINARIES_DIR}/u-boot.bin ${BOOT_FS_TMP}/linux/
#PATH="${HOST_DIR}/bin:${HOST_DIR}/sbin:${HOST_DIR}/usr/bin:${HOST_DIR}/usr/sbin:$PATH"
##rm -f ${BOOT_FS_IMAGE}
#mke2img -d ${BOOT_FS_TMP}/ -o ${BOOT_FS_IMAGE}
## Shrink the boot FS to within 1MB
#e2fsck boot.msdos
#resize2fs boot.msdos 900K


## Create user profile partition FS
#USER_FS_IMAGE=${BINARIES_DIR}/user.ext2
#USER_FS_TMP=${BUILD_DIR}/_user_profile
#mkdir -d ${USER_FS_TMP}
#PATH="${HOST_DIR}/bin:${HOST_DIR}/sbin:${HOST_DIR}/usr/bin:${HOST_DIR}/usr/sbin:$PATH"
#rm -f ${BOOT_FS_IMAGE}
#mke2img -d ${BOOT_FS_TMP}/ -o ${BOOT_FS_IMAGE}
## Shrink the boot FS to within 1MB
#e2fsck boot.msdos
#resize2fs boot.msdos 900K
