#!/bin/bash

w | grep pts | awk 'BEGIN{printf ("ITEM\tUSER\tTTY\tFROM\t\t\tLOGIN@\tIDLE\n")} {printf ("%s\t%s\t%s\t%s\t\t%s\t%s\n"), NR, $1, $2, $3, $4, $5}'
SESSIONS="$(w | grep pts | wc -l)"

read -p "Which TTY would you like to disconnect? " answer

if [ $answer -le $SESSIONS ] ; then
	ps faux |grep -v grep | grep sshd
	PROCNUM="$(ps faux |grep sshd | grep `w | grep pts | awk -v rownum="$answer" 'NR==rownum {printf ("%s\n"), $2}'` | grep -v grep | awk '{print $2}')"
	read -p "Killing process $PROCNUM, are you sure? (y/n) " KILLANS

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
