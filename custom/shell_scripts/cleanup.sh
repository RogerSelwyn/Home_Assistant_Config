#!/usr/bin/env bash

function tidy_up () {
    dirName=$1
    days=$2

    echo Clean up images older than $days days in $dirName
    calcdays=$((days-1))
    find "$dirName"/* -mtime +$calcdays -exec rm {} \;
}

# Set Variables
echo Set Variables
NEST_DIR_1=/config/nest/event_media/0ff91e4893c087da1e5fbdcef44684f1
NEST_DIR_2=/config/nest/event_media/da5a578f24992239d2359242d1d8d600
RING_DIR_1=/media/day
RING_DIR_2=/media/night
RING_DIR_3=/media/ding


# Clean up old images
tidy_up $NEST_DIR_1 7
tidy_up $NEST_DIR_2 7
tidy_up $RING_DIR_1 2
tidy_up $RING_DIR_2 2
tidy_up $RING_DIR_3 2

