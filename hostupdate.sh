#!/bin/bash

HOSTNAME=$(hostname)
EXITFLAG=0

echo "Apt Update Script"

while [ $EXITFLAG -eq 0 ] ; do

	echo -e "\n\nRunning on host $HOSTNAME"
	echo -e "What would you like to do? "

	echo -e "  1. Update PiCam"
	echo -e "  2. Update PiCore"
	echo -e "  3. Update PiZero"
	echo -e "  4. Update Altruist"
	echo -e "  5. Update All"
	echo -e "  q. Back"

	read -p ": " ANSWER

	case $ANSWER in
		1 )
			echo -e "\n     ----------     Updating PiCam...      ----------\n"
			if [ "$HOSTNAME" == "picam" ] ; then
				sudo ~/linuxscripts/apt-update.sh
			else
				ssh user@picam sudo ~/linuxscripts/apt-update.sh
			fi
		;;
		2 )
			echo -e "\n     ----------     Updating PiCore...     ----------\n"
			if [ "$HOSTNAME" == "picore" ] ; then
				sudo ~/linuxscripts/apt-update.sh
			else
				ssh user@picore sudo ~/linuxscripts/apt-update.sh
			fi
		;;
		3 )
			echo -e "\n     ----------     Updating Pi Zero...    ----------\n"
			if [ "$HOSTNAME" == "pizero" ] ; then
				sudo ~/linuxscripts/apt-update.sh
			else
				ssh user@pizero sudo ~/linuxscripts/apt-update.sh
			fi
		;;
		4 )
			echo -e "\n     ----------    Updating Altruist...    ----------\n"
			if [ "$HOSTNAME" == "altruist" ] ; then
				sudo ~/linuxscripts/apt-update.sh
			else
				ssh user@altruist sudo ~/linuxscripts/apt-update.sh
			fi
		;;
		5 )
			echo "Updating All..."
			echo -e "\n     ----------     Updating PiCam...      ----------\n"
			if [ "$HOSTNAME" == "picam" ] ; then
				sudo ~/linuxscripts/apt-update.sh
			else
				ssh user@picam sudo ~/linuxscripts/apt-update.sh
			fi
			echo -e "\n     ----------     Updating PiCore...     ----------\n"
			if [ "$HOSTNAME" == "picore" ] ; then
				sudo ~/linuxscripts/apt-update.sh
			else
				ssh user@picore sudo ~/linuxscripts/apt-update.sh
			fi
			echo -e "\n     ----------     Updating PiZero...     ----------\n"
			if [ "$HOSTNAME" == "pizero" ] ; then
				sudo ~/linuxscripts/apt-update.sh
			else
				ssh user@pizero sudo ~/linuxscripts/apt-update.sh
			fi
			echo -e "\n     ----------    Updating Altruist...    ----------\n"
			if [ "$HOSTNAME" == "altruist" ] ; then
				sudo ~/linuxscripts/apt-update.sh
			else
				ssh user@altruist sudo ~/linuxscripts/apt-update.sh
			fi
		;;
		q )
			echo "Ok, quitting"
			EXITFLAG=1
		;;
		BREAK )
		;;
		* )
			echo "Invalid choice"
		;;
	esac

done

