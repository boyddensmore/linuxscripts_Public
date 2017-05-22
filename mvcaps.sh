#!/bin/bash

DRYRUN=0

for i in "$@"
do
        case $i in
                -d|--dryrun)
                DRYRUN=1
                shift # past argument
                ;;
                *)
                ;;
        esac
        shift # past argument or value
done

if df -h | grep picam > /dev/null; then
	BDPC_MOUNTED=1
else
	BDPC_MOUNTED=0
	echo "BDPC Not Mounted.  No files will be moved."
fi

if [ $DRYRUN -eq 1 ] ; then

#	TOMVCAPCOUNT="$(ls -1 /home/pi/motioncaps | wc -l)"
#	FILESTOSORT="$(find /mnt/bdpc/picam/ -maxdepth 1 -regextype posix-egrep -regex "(.*)(((08)[3-5]{1}[0-9]{3})|((09)[0-9]{1}[0-9]{3})|((1[0-9])[0-9]{4})[-\.]).*" | wc -l)"
#	FILESTODELETE="$(find /home/pi/bdpc/* -type f -mtime +14 | wc -l)"

	echo -e "   Files to be moved: $(ls -1 /home/pi/motioncaps | wc -l) ($(du -sh /var/lib/motion | awk '{print $1}'))"
	echo -e "   Files over 7 days to be deleted: $(find /home/pi/bdpc/* -type f -mtime +7 | wc -l)"
	echo -e "   Current local space used: $(df -hl -t ext4 | awk '{percent+=$5;} END{print percent}')%"
#	echo -e "   Current Drobo space used: $(du -sh /home/pi/bdpc/ | awk '{print $1}')"

	read -p "Do you want to proceed (y/n)? " answer
	case ${answer:0:1} in
	    y|Y )
        	DRYRUN=0
	    ;;
	    * )
        	DRYRUN=1
	    ;;
	esac
fi

if [ $DRYRUN -eq 0 ] ; then

START_TIME=$SECONDS

#PRENIGHTCOUNT="$(ls -1 /home/pi/bdpc | wc -l)"
#PREDAYCOUNT="$(ls -1 /home/pi/bdpc/daytime | wc -l)"

if sudo rm /var/lib/motion/lastsnap.jpg 2> /dev/null ; then
	echo "$(date +%T)" ": Removed lastsnap.jpg"
else
	echo "$(date +%T)" ": No lastsnap.jpg to remove"
fi

TOMVCAPCOUNT="$(ls -1 /home/pi/motioncaps | wc -l)"

if [ "$TOMVCAPCOUNT" != "0" -a "$BDPC_MOUNTED" != "0" ] ; then
	echo "$(date +%T)" ": Moving $TOMVCAPCOUNT caps to drobo (${TOMVCAPDU})"
	TOMVCAPDU="$(du -sh /var/lib/motion | awk '{print $1}')"
	if sudo rsync  --info=progress2 --remove-source-files /var/lib/motion/* /mnt/bdpc/picam/ ; then
		echo "$(date +%T)" ": Caps moved"
	else
		echo "$(date +%T)" ": Issue moving caps"
	fi
else
	echo "$(date +%T)" ": No caps to move"
fi



FILESTOSORT="$(find /mnt/bdpc/picam/ -maxdepth 1 -regextype posix-egrep -regex "(.*)(((08)[3-5]{1}[0-9]{3})|((09)[0-9]{1}[0-9]{3})|((1[0-9])[0-9]{4})[-\.]).*" | wc -l)"
if [ "$FILESTOSORT" != "0" ] ; then
	echo "$(date +%T)" ": Sorting daytime caps"
	find /mnt/bdpc/picam/ -maxdepth 1 -regextype posix-egrep -regex "(.*)(((08)[3-5]{1}[0-9]{3})|((09)[0-9]{1}[0-9]{3})|((1[0-9])[0-9]{4})[-\.]).*" -exec mv '{}' /mnt/bdpc/picam/daytime/ \;
else
	echo "$(date +%T)" ": No daytime caps to "
fi

#TWODIGID="$(find /mnt/bdpc/picam/ -maxdepth 1 -regextype posix-egrep -regex "(.{27})(((08)[3-5]{1}[0-9]{3})|((09)[0-9]{1}[0-9]{3})|((1[0-9])[0-9]{4})[-\.]).*" | wc -l)"
#if [ "$TWODIGID" != "0" ] ; then
#	echo "$(date +%T)" ": Sorting daytime caps with 2 digit IDs"
#	find /mnt/bdpc/picam/ -maxdepth 1 -regextype posix-egrep -regex "(.{27})(((08)[3-5]{1}[0-9]{3})|((09)[0-9]{1}[0-9]{3})|((1[0-9])[0-9]{4})[-\.]).*" -exec mv '{}' /mnt/bdpc/picam/daytime/ \;
#	echo "${TWODIGID} two digit IDs sorted"
#fi

echo "$(date +%T)" ": Removing files over 7 days old"
FILESTODELETE="$(find /home/pi/bdpc/* -type f -mtime +7 | wc -l)"
find /home/pi/bdpc/* -type f -mtime +7 -exec rm {} \;

POSTNIGHTCOUNT="$(ls -1 /home/pi/bdpc | wc -l)"
POSTDAYCOUNT="$(ls -1 /home/pi/bdpc/daytime | wc -l)"

#echo "NightCaps: ${POSTNIGHTCOUNT}"
#echo "DayCaps: ${POSTDAYCOUNT}"

#PRECOUNT="$(expr $PRENIGHTCOUNT + $PREDAYCOUNT)"
POSTCOUNT="$(expr $POSTNIGHTCOUNT + $POSTDAYCOUNT)"
#FILEDELTA=$(($POSTCOUNT - $PRECOUNT))

#echo -e "   Pre-move file count: ${PRECOUNT}"
echo -e "   Files moved: ${TOMVCAPCOUNT} (${TOMVCAPDU})"
echo -e "   Daytime caps sorted: ${FILESTOSORT}"
echo -e "   Files over 7 days deleted: ${FILESTODELETE}"
#echo -e "   Total file count Change: ${FILEDELTA}"
echo -e "   Total remaining file count: ${POSTCOUNT}"

echo -e "   Local space used: $(df -hl -t ext4 | awk '{percent+=$5;} END{print percent}')%"
echo -e "   Drobo space used: $(du -s -h /home/pi/bdpc/ | awk '{print $1}')"


ELAPSED_TIME=$(($SECONDS - $START_TIME))

echo -e "Seconds elapsed: ${ELAPSED_TIME}"


fi #End dry-run if statement
