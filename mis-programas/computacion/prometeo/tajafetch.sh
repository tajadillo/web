
#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
negroColour="\e[0;30m\033[1m"
blancoColour="\e[0;37m\033[1m"
magentaColour="\e[0;35m\033[1m"


#[[ $- != *i* ]] && return

shopt -s autocd  ##automatically cd into directory
export HISTCONTROL=erasedups


RED='\033[0;31m'
GREY='\033[1;90m'

    #function tux () {
#echo -e	"							"
#echo -e	"    $RED			  ##			"
#echo -e "    $RED 			 ####			"
#echo -e "    $RED		 	######			"
#echo -e "    $RED		       ########			"
#echo -e "    $RED		      ##########		"
#echo -e "    $RED		     #####  #####		"
#echo -e "    $RED		    #####    #####		"
#echo -e "    $RED 		   ######    ######		"
#echo -e "    $RED 		  ########  ########		"
#echo -e "    $RED		 ####################		"
#echo -e "    $RED		######################		"
#echo -e "    $RED 	       #########      #########		"
#echo -e "    $RED 	      ########          ########	"
#echo -e "    $RED 	     #######              #######	"
#echo -e "    $RED 	    ######	            ######	"
#echo -e "    $RED	   #####      	              #####	"
#echo -e "    $RED	  ####                          ####	"
#echo -e "    $RED	 ###                              ###	"
#echo -e "    $RED	##				    ##	"
#echo -e "    $RED    #  				      #	"
    #}



#tux
function tux () {
echo -e " 							"
echo -e " 							"
echo -e "${negroColour}       #####      ${endColour}"
echo -e "${negroColour}      #######         ${endColour}"
echo -e "${negroColour}      ##${blancoColour}O${endColour}${negroColour}#${endColour}${blancoColour}O${endColour}${negroColour}##         ${endColour}"
echo -e "${negroColour}      #${yellowColour}#####${endColour}${redColour}${negroColour}#         ${endColour}"
echo -e "${negroColour}    ##${endColour}${blancoColour}##${endColour}${yellowColour}###${endColour}${blancoColour}##${endColour}${negroColour}##       ${endColour}"
echo -e "${negroColour}   ${negroColour}#${endColour}${blancoColour}##########${endColour}${negroColour}##      ${endColour}"
echo -e "${negroColour}  #${endColour}${blancoColour}############${endColour}${negroColour}##     ${endColour}"
echo -e "${negroColour}  #${endColour}${blancoColour}#############${endColour}${negroColour}##    ${endColour}"
echo -e "${yellowColour} ##${endColour}${negroColour}#${endColour}${blancoColour}###########${endColour}${negroColour}##${endColour}${yellowColour}#    ${endColour}"
echo -e "${yellowColour}######${endColour}${negroColour}#${blancoColour}#######${endColour}${yellowColour}####### ${endColour}"
echo -e "${yellowColour}#######${endColour}${negroColour}#${endColour}${blancoColour}#####${endColour}${negroColour}#${endColur}${yellowColour}####### ${endColour}"
echo -e "${yellowColour}  #####${endColour}${negroColour}#######${endColour}${yellowColour}#####    ${endColour}"
echo -e "                 "
echo -e "                 "
echo -e "                 "
echo -e "                 "
echo -e "                 "
echo -e "                 "
}








#info
function info () {
echo -e " 							"
echo -e " 							"
    #echo -e " ${negroColour}Máquina: $(hostname), Usuario: $(whoami)"
    #printf "$GREY DATE: " && date | awk '{print $1 " " $2 " " $3 " " $6}'
echo -e "$GREY EMAIL: richard.tajadillo@gmail.com"
echo -e "$GREY YOUTUBE: richard tajadillo"
    #echo -e "$GREY FACEBOOK: shastenm"
echo -e "$GREY INSTAGRAM: richard_alexander_tajadillo"
echo -e "$GREY WEB-SITE: https://tajadillo.github.io/web/"
    #echo -e "$GREY IRC-freenode: #archgeek"
echo -e "${negroColour} Sistema: $(lsb_release -d | cut -f2-)${endColour}"
printf "$GREY DISTRO: " && cat /proc/version | awk '{print $8 ',' $9 " "}' | sed 's/.//'
printf "$GREY KERNEL: " && uname -r
echo -e "$GREY PAQUETES: APT: $(dpkg --get-selections | wc -l), Snap: $(snap list | wc -l), Flatpak: $(flatpak list | wc -l)"
printf "$GREY CPU: " && lscpu | grep 'Model name' | awk '{print $3 " "$4}'
printf "$GREY GPU: " && lspci | grep VGA | awk '{print $9}' | sed 's:^.\(.*\).$:\1:'
printf "$GREY GPU: " && lspci | grep VGA | awk '{print $12 ',' $13 ',' $14}' | sed 's:^.\(.*\).$:\1:'
printf "$GREY RAM: " && awk '$3=="kB"{$2=$2/1024^2;$3="GB";} 1' /proc/meminfo | column -t | grep 'MemTotal:' | awk '{print $2}'
    #printf "$GREY FREE: " && awk '$3=="kB"{$2=$2/1024^2;$3="GB";} 1' /proc/meminfo | column -t | grep 'MemAvailable:' | awk '{print $2}'
    #printf "$GREY USED: " && awk '$3=="kB"{$2=$2/1024^2;$3="GB";} 1' /proc/meminfo | column -t | grep 'Active:' | awk '{print $2}'
printf "$GREY WM: " && echo -e "$GDMSESSION"
printf "$GREY SHELL: " && echo -e $SHELL
echo "$GREY ICONOS:" $(gsettings get org.gnome.desktop.interface icon-theme)
echo "$GREY CURSOR:" $(gsettings get org.gnome.desktop.interface cursor-theme)
    #echo "$GREY SWAP:" $(free -h | grep Swap)
echo "$GREY IP L ocal:" $(ip addr show | grep "inet " | awk '{print $2}')
echo "$GREY Interfaz de red activa:" $(ip route | grep default | awk '{print $5}')
    #echo "Porcentaje de batería:" $(upower -i $(upower -e | grep BAT) | grep percentage)
echo "$GREY Idioma del sistema:" $(echo $LANG)
echo -e " 							"








}

paste <( echo -e "$(tux)" ) <( echo -e "$(info)" )


