#!/usr/bin/bash

# To use this command, ensure that you have acpi, notify-send and AWK installed 

# Default time to check for battery status
TIME_S=180

# Default battery energy to check if battery is below this
NOTIFY_WHEN=15

while getopts "ht:n:" opt; do
case $opt in
    t)
        TIME_S=$OPTARG
    ;;
    n)
        NOTIFY_WHEN=$OPTARG
    ;;
    h)
	echo "Usage: ${1} [-t <time>] [-n <battery-limit> ] "
        exit 0 
    ;;	    
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
    ;;
esac
done

echo "Battery Notify running ... Check time: ${TIME_S}, send alert when battery is below: ${NOTIFY_WHEN}% ..."

while true 
do 
# ACPI will return something like: time%. so time%+0 will become just time
remaining_time=`acpi -b | awk -v FS=, ' { print $2+0 } '`
if [ $remaining_time -lt $NOTIFY_WHEN ]; then
    notify-send --urgency=CRITICAL "Battery is dying ..." "Your battery has ${remaining_time}% of remaining time before dead. Which is below the defined: ${NOTIFY_WHEN}%, you should put your laptot on a charger ..."
fi
sleep $TIME_S
done
