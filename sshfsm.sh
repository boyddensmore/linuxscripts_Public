#!/bin/bash

HOSTNAME=$(hostname)
MOUNT=0
UNMOUNT=0
LIST=0

case $HOSTNAME in
	picam)
		MOUNTDIR="/home/pi/pidir"
		HOST="picore"
		PORT="22"
		SSHUSER="pi"
	;;
	picore)
		MOUNTDIR="/home/pi/pidir"
		HOST="noms"
		PORT="8022"
		SSHUSER="root"
	;;
	altruist)
		MOUNTDIR="/home/boyd/pidir"
		HOST="picore"
		PORT="22"
		SSHUSER="pi"
	;;
	*)
		echo "Unknown host.  Exiting"
		exit 1
	;;
esac

for i in "$@"
do
	case $i in
		-m|--mount)
		MOUNT=1
		shift # past argument
		;;
		-u|--unmount)
		UNMOUNT=1
		shift # past argument
		;;
		-l|--list)
		LIST=1
		shift # past argument
		;;
		*)
		;;
	esac
	shift # past argument or value
done

if [ $UNMOUNT -eq 1 ] ; then
	echo "Unmounting sshfs"
	fusermount -u $MOUNTDIR 2> /dev/null
fi

if [ $MOUNT -eq 1 ] ; then
	echo "Mounting sshfs"
	sshfs "$SSHUSER"@"$HOST":pidir $MOUNTDIR -p $PORT
fi

if [ $LIST -eq 1 ] ; then
	if [ $UNMOUNT -eq 1 -o $MOUNT -eq 1 ] ; then
		df | grep @ | awk -v OFS='\t' 'BEGIN {print "\nNumber","Mount"} {print NR,$1}'
	else
		df | grep @ | awk -v OFS='\t' 'BEGIN {print "Number","Mount"} {print NR,$1 }'
	fi
fi

if [ $UNMOUNT -eq 0 -a $MOUNT -eq 0 -a $LIST -eq 0 ] ; then
	echo -e "Please specify one option.\nUsage: sshfsm [-m|--mount|-u|--unmount|-l|--list]"
	echo -e "\nOptions"
	echo -e "   [-m|--mount]: Mount all sshfs points"
	echo -e "   [-u|--unmount]: Unmount all sshfs points"
	echo -e "   [-l|--list]: List all connected sshfa points"
fi


