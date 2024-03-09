# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

negro="\033[1;30m"
rojo="\033[1;31m"
verde="\033[1;32m"
amarillo="\033[1;33m"
azul="\033[1;34m"
morado="\033[1;35m"
cian="\033[1;36m"
blanco="\033[1;37m"




#   ____    _    ____  _   _ ____   ____
#  | __ )  / \  / ___|| | | |  _ \ / ___|
#  |  _ \ / _ \ \___ \| |_| | |_) | |
# _| |_) / ___ \ ___) |  _  |  _ <| |___
#(_)____/_/   \_\____/|_| |_|_| \_\\____|








# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\nUsuario: \u @ \uHostname: \h: \nDirectorio actual: \w \$: \n'

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1=' \nUsuario: \u @ Hostname: \h: \nDirectorio actual: \w \$:  \n'

PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
 #    PS1='$(tput bold; tput setaf 1)############################## $(tput sgr0) $(tput setaf 6)\nUsuario:$(tput sgr0) $(tput setaf 3)\u$(tput sgr0) @ $(tput setaf 6)Maquina-Hostname:$(tput sgr0)  $(tput setaf 3)\h$(tput sgr0) $(tput setaf 6)\nDirectorio actual:$(tput sgr0) $(tput setaf 2)\w$(tput sgr0) $(tput setaf 1)\$ 😍😍😍 $:$(tput sgr0) \n$(tput bold; tput setaf 1)##############################$(tput sgr0)  \n'

 PS1='$(tput bold; tput setaf 1)\n>>>>>$(tput sgr0) $(tput setaf 2) \u$(tput sgr0)$(tput setaf 3)@$(tput sgr0)$(tput setaf 1)\h$(tput sgr0)$(tput sgr0)   $(tput setaf 0)\W$(tput sgr0) $(tput setaf 3)\$$(tput sgr0)    $(tput setaf 1)<<<<<$(tput sgr0)\n\n'


fi




##########################################
#Opciones del Prompt:
#
#    \a un caracter ASCII de ring
#    \d la fecha actual en formato "dia_sem mes día", "dom nov 18"
#    \e un caracter ASCII de escape
#    \h el nombre del equipo hasta el primer ., ejemplo linuxtotal de linuxtotal.com.mx
#    \H el nombre del equipo
#    \n nueva línea
#    \r retorno de carro, enter
#    \s el nombre del shell
#    \t el tiempo actual en formato de 24 horas HH:MM:SS
#    \T el tiempo actual en formato de 12 horas HH:MM:SS
#    \@ el tiempo actual en formaro de 12 horas con am/pm
#    \u el usuario actual
#    \v la version de bash
#    \V el número de release de batch, versión + parche
#    \w el directorio de trabajo actual, path
#    \W el nombre del directorio actual
#    \! el número en el historial del comando
#    \# el número de comando de este comando
#    \$ si el usuario es root (UID=0) se indica un '#', un usuario normal '$'
#    \\ diagonal
#    \[ inicio de una secuencia de caracteres no imprimibles
#    \] fin de la secuencia de caracteres no imprimibles

########################################











unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#mis aliasses
alias clima="curl wttr.in/arica?lang=es"
alias ver-imagen="kitty +kitten icat"
alias apagar='sudo shutdown -h now'
alias reiniciar='sudo shutdown -r now'
alias radio='bash /home/tajadillo/radio/radio.sh'
alias tv='bash /home/tajadillo/radio/tv.sh'
alias reloj='tty-clock -s -c -D'
alias alarma='bash alarma.sh'
alias mecano='typespeed'
alias instalar='sudo apt-get install'
alias temperatura='sensors | lolcat -a'
alias ficheros='df -h | lolcat -a'
alias directorios='df -h | lolcat -a'
alias vim=nvim
alias vi=nvim
alias bateria=acpi
alias descargavideos=./ClipGrab-3.9.7-x86_64.AppImage
alias ifconfig=/sbin/ifconfig
alias soloLectura='sudo mount -o remount,rw /media/tajadillo/TAJA-CEL/'
alias neofetch="neofetch --size none"
alias donde='pwd | lolcat -a'
#instalar lsd "sudo apt-get install lsd" y remplazar por el comando "ls"
alias ls=lsd
#descargar é instalar con sudo dpkg https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb
alias cat='/bin/bat'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lah --group-dirs=first'
alias ls='lsd --group-dirs=first'
#sudo apt-get install tor proxychains
#nvim /etc/proxychains.conf comentar strict_chain y descomentar dynamic_chain
#pegar nueva linea con [socks5 	127.0.0.1 9050}
#sudo service tor start
#sudo service tor status para verificar que todo va de forma correcta
alias invisible='proxychains brave-browser google.com'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



echo -e $amarillo "                                                               "
echo "                                   XXX                         "
echo -e $verde "                                 (o o)                        "
echo "             ESTOY            ooO--(_)--Ooo           LISTO              "
echo -e $amarillo " _______           _         _____ _____ _      _      ____   "
echo " |__   __|/\       | |  /\   |  __ \_   _| |    | |    / __ \  "
echo "    | |  /  \      | | /  \  | |  | || | | |    | |   | |  | | "
echo "    | | / /\ \ _   | |/ /\ \ | |  | || | | |    | |   | |  | | "
echo "    | |/ ____ \ |__| / ____ \| |__| || |_| |____| |___| |__| | "
echo "    |_/_/    \_\____/_/    \_\_____/_____|______|______\____/  "
echo "                                                               "

#neofetch

export C_INCLUDE_PATH=/usr/lib/avr/include
