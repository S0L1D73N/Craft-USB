#!/bin/bash

# Syncronises the payload to the imagefile of the target storagedevice.
# This should alway be run before the ATTACKMODE, because this write-locks the imagefile.

BUNNY_DIR="/bunny"

umount ${BUNNY_DIR}/storage/system.img
mount ${BUNNY_DIR}/storage/system.img ${BUNNY_DIR}/mnt
rsync -av ${BUNNY_DIR}/payloads ${BUNNY_DIR}/mnt
rm ${BUNNY_DIR}/mnt/target_finished # clean up and make sure the target can make this file when he finishes his job
umount ${BUNNY_DIR}/mnt