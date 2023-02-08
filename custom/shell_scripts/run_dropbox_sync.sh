#!/usr/bin/env bash

# mkdir /mnt/data2
# mount /dev/sda2 /mnt/data2
# cd /mnt/data2
# ls -al

# Set Variables
echo Set Variables
DROPBOX_UPLOADER=/config/custom/shell_scripts/dropbox_uploader.sh
BKP_CONFIG=/config/custom/shell_scripts/.dropbox_uploader
BKP_DIR=/backup
BKP_FOLDER=/debian

# Copy Home Assistant Snapshots to DropBox
echo Sync Dropbox
$DROPBOX_UPLOADER -sf $BKP_CONFIG upload "$BKP_DIR" $BKP_FOLDER

# Clean up older snapshots - removes older than 5 days
echo Clean up old snapshots
find "$BKP_DIR"/* -mtime +4 -exec rm {} \;

# Reload Snapshots in Home Assistant
# echo Reload snapshots
# ha backups reload

# mkdir /mnt/data
# mount /dev/sda1 /mnt/data
# umount /mnt/data
# rmdir /mnt/data
