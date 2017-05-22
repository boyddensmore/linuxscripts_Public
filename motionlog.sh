#!/bin/bash

MOTIONPIXELS=$1
CURHOUR=`date "+%H"`

echo "Pixels: "$MOTIONPIXELS

if [ $CURHOUR -lt 9 -o $CURHOUR -ge 21 ] ; then
	echo "Nighttime"

#        if [ -n "$MOTIONPIXELS" ] ; then
                echo "$(date +%m%d%y-%H%M%S), $MOTIONPIXELS"px >> /home/pi/mlog/mlog-night.log
#       else
#                echo "$(date +%m%d%y-%H%M%S)" >> /home/pi/mlog/mlog-night.log
#        fi

else
        echo "Daytime"

#	if [ -n "$MOTIONPIXELS" ] ; then
                echo "$(date +%m%d%y-%H%M%S), $MOTIONPIXELS"px >> /home/pi/mlog/mlog-day.log
#	else
#		echo "$(date +%m%d%y-%H%M%S)" >> /home/pi/mlog/mlog-day.log
#	fi

fi

