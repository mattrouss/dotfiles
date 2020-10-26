#!/bin/bash

# somewhat deamon update count + icon
# written by Nathaniel Maia, 2019

ICON=""

if ! hash checkupdates inotifywait >/dev/null 2>&1; then
    echo 'error: check-update: requires "pacman-contrib" and "inotify-tools" installed' >&2
    exit 1
fi

[ -p /tmp/.update_status ] || mkfifo /tmp/.update_status

# wait until were connected
until ping -c 1 'archlinux.org' >/dev/null 2>&1 || ping -c 1 'archlabslinux.com' >/dev/null 2>&1; do
    sleep 10
done

# loop and dump info to the pipe
while true; do
    COUNT=$(checkupdates 2>/dev/null | wc -l)
    echo "$ICON $COUNT " >/tmp/.update_status
    if (( $COUNT > 0 )); then
        # recheck when the log is written to or after 1.5 hours
        inotifywait -q -q -t 5000 -e close_write /var/log/pacman.log
        sleep 3
    else
        sleep 5000 # only do a recheck every 1.5 hours to save some cpu time
    fi
done
