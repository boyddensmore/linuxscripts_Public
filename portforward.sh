#!/bin/bash
#

# Forward array indexes
NAME=0
IP=1
SRC_PORT=2
DST_PORT=3

# Forward definitions
# Noms Admin
FWD_NOMS_ADMIN[$NAME]="Noms Admin"
FWD_NOMS_ADMIN[$IP]="xxx.xxx.xxx.xxx"
FWD_NOMS_ADMIN[$SRC_PORT]=0000
FWD_NOMS_ADMIN[$DST_PORT]=0000

# PiCore SSH
FWD_PICORE_SSH[$NAME]="PiCore SSH"
FWD_PICORE_SSH[$IP]="xxx.xxx.xxx.xxx"
FWD_PICORE_SSH[$SRC_PORT]=0000
FWD_PICORE_SSH[$DST_PORT]=0000

# PiCore Motion View
FWD_PICORE_MOT[$NAME]="PiCore Motion View"
FWD_PICORE_MOT[$IP]="xxx.xxx.xxx.xxx"
FWD_PICORE_MOT[$SRC_PORT]=0000
FWD_PICORE_MOT[$DST_PORT]=0000

# PiCore Motion Admin
FWD_PICORE_MOTADMIN[$NAME]="PiCore Motion Admin"
FWD_PICORE_MOTADMIN[$IP]="xxx.xxx.xxx.xxx"
FWD_PICORE_MOTADMIN[$SRC_PORT]=0000
FWD_PICORE_MOTADMIN[$DST_PORT]=0000

# PiCam SSH
FWD_PICAM_SSH[$NAME]="PiCam SSH"
FWD_PICAM_SSH[$IP]="xxx.xxx.xxx.xxx"
FWD_PICAM_SSH[$SRC_PORT]=0000
FWD_PICAM_SSH[$DST_PORT]=0000

# PiCam Motion View
FWD_PICAM_MOT[$NAME]="PiCam Motion View"
FWD_PICAM_MOT[$IP]="xxx.xxx.xxx.xxx"
FWD_PICAM_MOT[$SRC_PORT]=0000
FWD_PICAM_MOT[$DST_PORT]=0000

# PiCam Motion Admin
FWD_PICAM_MOTADMIN[$NAME]="PiCam Motion Admin"
FWD_PICAM_MOTADMIN[$IP]="xxx.xxx.xxx.xxx"
FWD_PICAM_MOTADMIN[$SRC_PORT]=0000
FWD_PICAM_MOTADMIN[$DST_PORT]=0000

# PiTV SSH
FWD_PITV_SSH[$NAME]="PiTV SSH"
FWD_PITV_SSH[$IP]="xxx.xxx.xxx.xxx"
FWD_PITV_SSH[$SRC_PORT]=0000
FWD_PITV_SSH[$DST_PORT]=0000

# Leah Lappy VNC
FWD_LEAHLAPPY_VNC[$NAME]="Lappy VNC"
FWD_LEAHLAPPY_VNC[$IP]="xxx.xxx.xxx.xxx"
FWD_LEAHLAPPY_VNC[$SRC_PORT]=0000
FWD_LEAHLAPPY_VNC[$DST_PORT]=0000

EXITFLAG=0

echo "LinuxScript Port Forward Script"

while [ $EXITFLAG -eq 0 ] ; do

	echo -e "What would you like to do? "

	echo -e "1. Forward a port"
	echo -e "2. List existing forwards"
	echo -e "3. Kill a forwarded port"
	echo -e "q. Quit"

	read -p ": " ANSWER

	case $ANSWER in
	1 )
		echo -e "\n\nForward a port\n"
		echo -e "Noms:"
		echo -e "  1. Noms Admin ($PORT_SRC_NOMS_ADMIN -> $PORT_DST_NOMS_ADMIN)"
		echo -e "PiCore:"
		echo -e "  2. PiCore SSH ($PORT_SRC_PICORE_SSH -> $PORT_DST_PICORE_SSH)"
		echo -e "  3. PiCore Motion View ($PORT_SRC_PICORE_MOT -> $PORT_DST_PICORE_MOT)"
		echo -e "  4. PiCore Motion Admin ($PORT_SRC_PICORE_MOTADMIN -> $PORT_DST_PICORE_MOTADMIN)"
		echo -e "PiCam:"
		echo -e "  5. PiCam SSH ($PORT_SRC_PICAM_SSH -> $PORT_DST_PICAM_SSH)"
		echo -e "  6. PiCam Motion View ($PORT_SRC_PICAM_MOT -> $PORT_DST_PICAM_MOT)"
		echo -e "  7. PiCam Motion Admin ($PORT_SRC_PICAM_MOTADMIN -> $PORT_DST_PICAM_MOTADMIN)"
		echo -e "PiTV:"
		echo -e "  8. PiTV SSH/SCP ($PORT_SRC_PITV_SSH -> $PORT_DST_PITV_SSH)"
		echo -e "Leah Lappy:"
		echo -e "  9. Leah Lappy VNC ($PORT_SRC_LEAHLAPPY_VNC -> $PORT_DST_LEAHLAPPY_VNC)"
		
		echo -e "  q. Back"

		read -p ": " ANSWER

		case $ANSWER in
			1 )
				echo -e "\n     ----------     Forwarding Noms Admin...     ----------\n"
				ssh -fNL $PORT_SRC_NOMS_ADMIN:xxx.xxx.xxx.xxxPORT_DST_NOMS_ADMIN user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_NOMS_ADMIN to Noms:$PORT_DST_NOMS_ADMIN \n"
			;;

			2 )
				echo -e "\n     ----------     Forwarding PiCore SSH...     ----------\n"
				ssh -fNL $PORT_SRC_PICORE_SSH:xxx.xxx.xxx.xxx:$PORT_DST_PICORE_SSH user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_PICORE_SSH to PiCore:$PORT_DST_PICORE_SSH \n"
			;;

			3 )
				echo -e "\n     ----------     Forwarding PiCore Motion View...     ----------\n"
				ssh -fNL $PORT_SRC_PICORE_MOT:xxx.xxx.xxx.xxx:$PORT_DST_PICORE_MOT user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_PICORE_MOT to PiCore:$PORT_DST_PICORE_MOT \n"
			;;

			4 )
				echo -e "\n     ----------     Forwarding PiCore Motion Admin...     ----------\n"
				ssh -fNL $PORT_SRC_PICORE_MOTADMIN:xxx.xxx.xxx.xxx:$PORT_DST_PICORE_MOTADMIN user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_PICORE_MOTADMIN to PiCore:$PORT_DST_PICORE_MOTADMIN \n"
			;;

			5 )
				echo -e "\n     ----------     Forwarding PiCam SSH...     ----------\n"
				ssh -fNL $PORT_SRC_PICAM_SSH:xxx.xxx.xxx.xxx:$PORT_DST_PICAM_SSH user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_PICAM_SSH to PiCam:$PORT_DST_PICAM_SSH \n"
			;;

			6 )
				echo -e "\n     ----------     Forwarding PiCam Motion View...     ----------\n"
				ssh -fNL $PORT_SRC_PICAM_MOT:xxx.xxx.xxx.xxx:$PORT_DST_PICAM_MOT user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_PICAM_MOT to PiCam:$PORT_DST_PICAM_MOT \n"
			;;

			7 )
				echo -e "\n     ----------     Forwarding PiCam Motion Admin...     ----------\n"
				ssh -fNL $PORT_SRC_PICAM_MOTADMIN:xxx.xxx.xxx.xxx:$PORT_DST_PICAM_MOTADMIN user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_PICAM_MOTADMIN to PiCam:$PORT_DST_PICAM_MOTADMIN \n"
			;;

			8 )
				echo -e "\n     ----------     Forwarding PiTV SCP...     ----------\n"
				ssh -fNL $PORT_SRC_PITV_SSH:xxx.xxx.xxx.xxx:$PORT_DST_PITV_SSH user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_PITV_SSH to PiTV:$PORT_DST_PITV_SSH \n"
			;;

			9 )
				echo -e "\n     ----------     Forwarding Leah Lappy VNC...     ----------\n"
				ssh -fNL $PORT_SRC_LEAHLAPPY_VNC:xxx.xxx.xxx.xxx:$PORT_DST_LEAHLAPPY_VNC user@host -p 0000
				echo -e "\n     Forwarded port $PORT_SRC_LEAHLAPPY_VNC to LeahLappy:$PORT_DST_LEAHLAPPY_VNC \n"
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
		echo -e "\n     ----------     Existing port forwards...     ----------\n"
		ps -ef | grep "ssh -fNL" | grep -v grep | awk 'BEGIN {print "Forward\tPID\tPort Forward"} {printf ("%s\t%s\t%s\n"), NR, $2, $10}'
		echo -e "\n"
	;;

	3 )
		echo -e "\n     ----------     Kill port forward...     ----------\n"
		SESSIONS="$(ps -ef | grep "ssh -fNL" | grep -v grep | wc -l)"

		if [ $SESSIONS -gt 0 ] ; then

			ps -ef | grep "ssh -fNL" | grep -v grep | awk 'BEGIN {print "Forward\tPID\tPort Forward"} {printf ("%s\t%s\t%s\n"), NR, $2, $10}'

			read -p "Which forward would you like to disconnect? (Enter a for All) " answer

			if [ $answer == "a" ] ; then
				read -p "About to disconnect all port forwards, are you sure? (y/n) " KILLANS

				case ${KILLANS:0:1} in
		            y|Y )
						while [ $SESSIONS -gt 0 ] ; do
							PROCNUM="$(ps -ef | grep "ssh -fNL" | grep -v grep | awk -v rownum="1" 'NR==rownum {print $2}')"
							PROCNAME="$(ps -ef | grep "ssh -fNL" | grep -v grep | awk -v rownum="1" 'NR==rownum {print $10}')"

							kill -9 $PROCNUM
							echo "Killed $PROCNAME"

							SESSIONS="$(ps -ef | grep "ssh -fNL" | grep -v grep | wc -l)"
						done

						echo -e "\n"
		            ;;
		            * )
		                echo "OK, cancelling."
		                echo -e "\n"
		            ;;
				esac

			else

				if [ $answer -le $SESSIONS ] ; then
					PROCNUM="$(ps -ef | grep "ssh -fNL" | grep -v grep | awk -v rownum="$answer" 'NR==rownum {print $2}')"
					PROCNAME="$(ps -ef | grep "ssh -fNL" | grep -v grep | awk -v rownum="$answer" 'NR==rownum {print $10}')"

					read -p "Killing process $PROCNUM ($PROCNAME), are you sure? (y/n) " KILLANS

					case ${KILLANS:0:1} in
			            y|Y )
			                kill -9 $PROCNUM
			            ;;
			            * )
			                echo "OK, cancelling."
			            ;;
				    esac

				else
					echo "Invalid Choice"
				fi
			fi
		else
			echo -e "No forwards to disconnect\n"
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
