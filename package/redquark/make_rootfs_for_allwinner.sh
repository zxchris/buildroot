#!/bin/bash

ORIG_ROOTFS_IMG=output/images/rootfs.ext4
TMP_ROOTFS_IMG=/tmp/rootfs.ext4
ROOTFS_MNT=/tmp/rootfs
ROOTTARGZ=output/images/redquark-rootfs.tar.gz

mkdir -p ${ROOTFS_MNT}
cp ${ORIG_ROOTFS_IMG} ${TMP_ROOTFS_IMG}
mount -oloop ${TMP_ROOTFS_IMG} ${ROOTFS_MNT} 

rm -rf ${ROOTFS_MNT}/lib/modules/ ${ROOTFS_MNT}/boot/ ${ROOTFS_MNT}/linuxrc ${ROOTFS_MNT}/lib32

BR=${PWD}
cd ${ROOTFS_MNT}/..
tar czf ${BR}/${ROOTTARGZ} rootfs

echo "Created ${BR}/${ROOTTARGZ} ..."
echo "FS Size: "
cd ${ROOTFS_MNT}
du -sh
cd ${BR}

umount ${ROOTFS_MNT}
