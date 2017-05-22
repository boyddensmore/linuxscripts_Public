#!/bin/bash

HOSTNAME=$(hostname)
EXITFLAG=0
REPONAME=$1

if [ -z "$1" ] ; then
	REPONAME="linuxscripts"
else
	REPONAME="$1"
fi

echo "LinuxScript Update Script"

while [ $EXITFLAG -eq 0 ] ; do

	echo -e "\n\nRunning on repository $REPONAME"
	echo -e "What would you like to do? "

	echo -e "1. Update from GitHub"
	echo -e "2. Check Statuses"
	echo -e "3. Change Repository"
	echo -e "q. Quit"

	read -p ": " ANSWER

	case $ANSWER in
	1 )
		echo -e "\nRunning on repository $REPONAME"
		echo -e "Update from GitHub"
		echo -e "  1. Update PiCam"
		echo -e "  2. Update PiCore"
		echo -e "  3. Update PiZero"
		echo -e "  4. Update Altruist"
		echo -e "  5. Update All"
		echo -e "  q. Back"

		read -p ": " ANSWER

		case $ANSWER in
			1 )
				echo -e "\n     ----------     Updating PiCam...     ----------\n"
				if [ "$HOSTNAME" == "picam" ] ; then
					git -C /home/pi/"$REPONAME"/ pull
				else
					ssh pi@picam git -C /home/pi/"$REPONAME"/ pull
				fi
			;;
			2 )
				echo -e "\n     ----------     Updating PiCore...     ----------\n"
				if [ "$HOSTNAME" == "picore" ] ; then
					git -C /home/pi/"$REPONAME"/ pull
				else
					ssh pi@picore git -C /home/pi/"$REPONAME"/ pull
				fi
			;;
			3 )
				echo -e "\n     ----------     Updating Pi Zero...     ----------\n"
				if [ "$HOSTNAME" == "pizero" ] ; then
					git -C /home/pi/"$REPONAME"/ pull
				else
					ssh pi@pizero git -C /home/pi/"$REPONAME"/ pull
				fi

			;;
			4 )
				echo -e "\n     ----------     Updating Altruist...     ----------\n"
				if [ "$HOSTNAME" == "altruist" ] ; then
					git -C /home/boyd/"$REPONAME"/ pull
				else
					ssh boyd@altruist git -C /home/boyd/"$REPONAME"/ pull
				fi

			;;
			5 )
				echo "Updating All..."
				echo -e "\n     ----------     Updating PiCam...     ----------\n"
				if [ "$HOSTNAME" == "picam" ] ; then
					git -C /home/pi/"$REPONAME"/ pull
				else
					ssh pi@picam git -C /home/pi/"$REPONAME"/ pull
				fi
				echo -e "\n     ----------     Updating PiCore...     ----------\n"
				if [ "$HOSTNAME" == "picore" ] ; then
					git -C /home/pi/"$REPONAME"/ pull
				else
					ssh pi@picore git -C /home/pi/"$REPONAME"/ pull
				fi
				echo -e "\n     ----------     Updating PiZero...     ----------\n"
				if [ "$HOSTNAME" == "pizero" ] ; then
					git -C /home/pi/"$REPONAME"/ pull
				else
					ssh pi@pizero git -C /home/pi/"$REPONAME"/ pull
				fi
				echo -e "\n     ----------     Updating Altruist...     ----------\n"
				if [ "$HOSTNAME" == "altruist" ] ; then
					git -C /home/boyd/"$REPONAME"/ pull
				else
					ssh boyd@altruist git -C /home/boyd/"$REPONAME"/ pull
				fi
			;;
			q )
			;;
			BREAK )
			;;
			* )
				echo "Invalid choice"
			;;
		esac
	;;
	2 )
		echo -e "\nRunning on repository $REPONAME"
		echo -e "Check Statuses"
		echo -e "  1. Check PiCam"
		echo -e "  2. Check PiCore"
		echo -e "  3. Check PiZero"
		echo -e "  4. Check Altruist"
		echo -e "  5. Check All"
		echo -e "  q. Back"

		read -p ": " ANSWER

		case $ANSWER in
			1 )
				echo "Host Status"
				echo -e "\n     ----------     PiCam...     ----------\n"
				if [ "$HOSTNAME" == "picam" ] ; then
					git -C /home/pi/"$REPONAME"/ remote update && git -C /home/pi/"$REPONAME"/ status -uno
				else
					ssh pi@picam "git -C /home/pi/$REPONAME/ remote update && git -C /home/pi/$REPONAME/ status -uno"
				fi
			;;
			2 )
				echo "Host Status"
				echo -e "\n     ----------     PiCore...     ----------\n"
				if [ "$HOSTNAME" == "picore" ] ; then
					git -C /home/pi/"$REPONAME"/ remote update && git -C /home/pi/"$REPONAME"/ status -uno
				else
					ssh pi@picore "git -C /home/pi/$REPONAME/ remote update && git -C /home/pi/$REPONAME/ status -uno"
				fi
			;;
			3 )
				echo "Host Status"
				echo -e "\n     ----------     PiZero...     ----------\n"
				if [ "$HOSTNAME" == "pizero" ] ; then
					git -C /home/pi/"$REPONAME"/ remote update && git -C /home/pi/"$REPONAME"/ status -uno
				else
					ssh pi@zero "git -C /home/pi/$REPONAME/ remote update && git -C /home/pi/$REPONAME/ status -uno"
				fi
			;;
			4 )
				echo "Host Status"
				echo -e "\n     ----------     Altruist...     ----------\n"
				if [ "$HOSTNAME" == "altruist" ] ; then
					git -C /home/boyd/"$REPONAME"/ remote update && git -C /home/boyd/"$REPONAME"/ status -uno
				else
					ssh boyd@altruist "git -C /home/boyd/$REPONAME/ remote update && git -C /home/boyd/$REPONAME/ status -uno"
				fi
			;;
			5 )
				echo "Host Statuses"
				echo -e "\n     ----------     PiCam...     ----------\n"
				if [ "$HOSTNAME" == "picam" ] ; then
					git -C /home/pi/"$REPONAME"/ remote update && git -C /home/pi/"$REPONAME"/ status -uno
				else
					ssh pi@picam "git -C /home/pi/$REPONAME/ remote update && git -C /home/pi/$REPONAME/ status -uno"
				fi
				echo -e "\n     ----------     PiCore...     ----------\n"
				if [ "$HOSTNAME" == "picore" ] ; then
					git -C /home/pi/"$REPONAME"/ remote update && git -C /home/pi/"$REPONAME"/ status -uno
				else
					ssh pi@picore "git -C /home/pi/$REPONAME/ remote update && git -C /home/pi/$REPONAME/ status -uno"
				fi
				echo -e "\n     ----------     PiZero...     ----------\n"
				if [ "$HOSTNAME" == "pizero" ] ; then
					git -C /home/pi/"$REPONAME"/ remote update && git -C /home/pi/"$REPONAME"/ status -uno
				else
					ssh pi@pizero "git -C /home/pi/$REPONAME/ remote update && git -C /home/pi/$REPONAME/ status -uno"
				fi
				echo -e "\n     ----------     Altruist...     ----------\n"
				if [ "$HOSTNAME" == "altruist" ] ; then
					git -C /home/boyd/"$REPONAME"/ remote update && git -C /home/boyd/"$REPONAME"/ status -uno
				else
					ssh boyd@altruist "git -C /home/boyd/$REPONAME/ remote update && git -C /home/boyd/$REPONAME/ status -uno"
				fi
			;;
			q )
			;;
			BREAK )
			;;
			* )
				echo "Invalid choice"
			;;
		esac


	;;
	3 )
		echo -e "\n\nSwitching Repository "

		REPOS="$(find ~/ -maxdepth 5 -name .git | grep -v brew | wc -l)"
		find ~/ -maxdepth 5 -name .git | awk '{print gensub(/\/[a-z]+\/[a-z]+\//, "", "")}' | awk '{print NR ": " gensub(/\/.git/, "", "")}'

		read -p "Which repository would you like to switch to? " ANSWER

		if [ $ANSWER -le $REPOS ] ; then
			REPONAME="$(find ~/ -maxdepth 5 -name .git | awk '{print gensub(/\/[a-z]+\/[a-z]+\//, "", "")}' | awk -v rownum=$ANSWER '{if (NR==rownum) print gensub(/\/.git/, "", "")}')"
			echo "New repository: $REPONAME"
		else
			echo "Invalid Choice"
		fi

	;;
	q )
		echo "Ok, quitting"
		EXITFLAG=1
	;;
	* )
		echo "Invalid choice"
		ANSWER="BREAK"
	;;
	esac

done
