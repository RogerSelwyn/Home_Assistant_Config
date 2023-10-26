#!/usr/bin/env bash

# Set Variables
echo Set Variables
DROPBOX_UPLOADER=/config/custom/shell_scripts/dropbox_uploader.sh
BKP_CONFIG=/config/custom/secrets/.quotes_uploader
BKP_DIR=/config/custom/quotes
BKP_FOLDER=/Home/Money

# Copy Home Assistant Snapshots to DropBox
echo Sync Dropbox
$DROPBOX_UPLOADER -f $BKP_CONFIG upload "$BKP_DIR" $BKP_FOLDER
