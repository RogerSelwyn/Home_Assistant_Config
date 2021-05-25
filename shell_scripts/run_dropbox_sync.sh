#!/usr/bin/env bash

mkdir /mnt/data
mount /dev/sda1 /mnt/data

# Set Variables
DROPBOX_UPLOADER=/config/shell_scripts/dropbox_uploader.sh
BKP_CONFIG=/config/shell_scripts/.dropbox_uploader
BKP_DIR=/mnt/data/usr/share/hassio/backup
BKP_FOLDER=/debian

# Copy Home Assistant Snapshots to DropBox
$DROPBOX_UPLOADER -sf $BKP_CONFIG upload "$BKP_DIR" $BKP_FOLDER

# Clean up older snapshots - removes older than 5 days
find "$BKP_DIR"/* -mtime +4 -exec rm {} \;
umount /mnt/data
rmdir /mnt/data
