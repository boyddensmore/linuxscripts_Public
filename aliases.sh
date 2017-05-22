#!/bin/bash


#Add the following to your .bashrc to call these aliases
#
#import="/home/$USER/linuxscripts/aliases.sh"
#
#if [[ -f "$import" ]]; then
#    source "$import"
#else
#    echo "Could not source ${import}. File does not exist."
#fi

#Core aliases
alias cp='rsync --info=progress2'
alias ll='ls -alF'
alias ls='ls -h --color=auto'


#LinuxScript aliases

alias apt-autoupdate='sudo ~/linuxscripts/apt-update.sh'
alias sshfsm='~/linuxscripts/sshfsm.sh'
alias killu='~/linuxscripts/killu.sh'
alias supdate='~/linuxscripts/scriptupdate.sh'
alias portforward='~/linuxscripts/portforward.sh'
alias hostupdate='~/linuxscripts/hostupdate.sh'

#Uncommon aliases

HOSTNAME=$(hostname)

case $HOSTNAME in
        picam)
		alias mvcaps='sudo ~/linuxscripts/mvcaps.sh'
		alias ml='~/linuxscripts/motionlog.sh'
		alias arec='arecord -D plughw:1,0'
		alias motof="sudo ls -l /proc/`ps -C motion -o pid= | awk '{print $1}'`/fd | grep /var/lib/motion"
		export PATH="$HOME/.linuxbrew/bin:$PATH"
		export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
                export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
		eval "$(hub alias -s)"

        ;;
        picore)
        ;;
        altruist)
        ;;
	boyd-pc2)
	;;
	harrisburg)
		echo "LinuxScripts Aliases: No custom aliases for Harrisburg."
	;;
	pizero)
	;;
	PITV)
	;;
        *)
                echo "Unknown host, but that's probably OK"
        ;;
esac
