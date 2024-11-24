#!/bin/bash


#[[ $- != *i* ]] && return

shopt -s autocd  ##automatically cd into directory
export HISTCONTROL=erasedups


RED='\033[0;31m'
GREY='\033[1;90m'

function logo () {
echo -e	"							"
echo -e	"    $RED			  ##			"
echo -e "    $RED 			 ####			"
echo -e "    $RED		 	######			"
echo -e "    $RED		       ########			"
echo -e "    $RED		      ##########		"
echo -e "    $RED		     #####  #####		"
echo -e "    $RED		    #####    #####		"
echo -e "    $RED 		   ######    ######		"
echo -e "    $RED 		  ########  ########		"
echo -e "    $RED		 ####################		"
echo -e "    $RED		######################		"
echo -e "    $RED 	       #########      #########		"
echo -e "    $RED 	      ########          ########	"
echo -e "    $RED 	     #######              #######	"
echo -e "    $RED 	    ######	            ######	"
echo -e "    $RED	   #####      	              #####	"
echo -e "    $RED	  ####                          ####	"
echo -e "    $RED	 ###                              ###	"
echo -e "    $RED	##				    ##	"
echo -e " $RED      #				      #	"
}


#info
function info () {
echo -e " 							"
printf "$GREY DATE: " && date | awk '{print $1 " " $2 " " $3 " " $6}'
echo -e "$GREY EMAIL: richard.tajadillo@gmail.com"
echo -e "$GREY YOUTUBE: richard tajadillo"
#echo -e "$GREY FACEBOOK: shastenm"
echo -e "$GREY INSTAGRAM: richard_alexander_tajadillo"
echo -e "$GREY GIT: https://gitlab.com/shastenm76"
echo -e "$GREY IRC-freenode: #archgeek"
printf "$GREY DISTRO: " && cat /proc/version | awk '{print $8 ',' $9 " "}' | sed 's/.//' 
printf "$GREY KERNEL: " && uname -r
printf "$GREY CPU: " && lscpu | grep 'Model name' | awk '{print $3 " "$4}' 
printf "$GREY GPU: " && lspci | grep VGA | awk '{print $9}' | sed 's:^.\(.*\).$:\1:'  
printf "$GREY GPU: " && lspci | grep VGA | awk '{print $12 ',' $13 ',' $14}' | sed 's:^.\(.*\).$:\1:'
printf "$GREY RAM: " && awk '$3=="kB"{$2=$2/1024^2;$3="GB";} 1' /proc/meminfo | column -t | grep 'MemTotal:' | awk '{print $2}' 
printf "$GREY FREE: " && awk '$3=="kB"{$2=$2/1024^2;$3="GB";} 1' /proc/meminfo | column -t | grep 'MemAvailable:' | awk '{print $2}' 
printf "$GREY USED: " && awk '$3=="kB"{$2=$2/1024^2;$3="GB";} 1' /proc/meminfo | column -t | grep 'Active:' | awk '{print $2}'
printf "$GREY WM: " && echo -e "$GDMSESSION" 
printf "$GREY SHELL: " && echo -e $SHELL 
printf "$GREY HORA: " && date | awk '{print $4}'
echo -e " 							"
echo -e " 							"
echo -e " 							"
}	

paste <( echo -e "$(logo)" ) <( echo -e "$(info)" )


















