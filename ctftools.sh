#!/bin/bash

YELLOW='\e[1;33m'
PURPLE='\e[1;35m'
RED='\e[1;31m'
CYAN='\e[1;32m'
END='\e[0m'


echo -e "${PURPLE}"
echo -e "[*] Auto Install CTF Tools & Wordlists [*]"
echo -e "[*] Please, execute the script as sudo [*]"
echo -e "${END}"
read -p "Select where you want to install the script: " dirdown

if [ -z "$dirdown" ]; then
         echo -e "${RED}${END}[!] Specify a directory, please [!] ${END}"
else
	if [ ! -d "$dirdown" ]; then
		mkdir "$dirdown"/
		mkdir "$dirdown"/Tools
		mkdir "$dirdown"/Wordlists
		mkdir "$dirdown"/LinuxScripts
	else
		mkdir "$dirdown"/Tools
		mkdir "$dirdown"/Wordlists
		mkdir "$dirdown"/LinuxScripts
	fi
fi

cloneRepo(){
cd "$dirdown"/Tools || exit
echo -e "${YELLOW}${END}[+] Cloning Dirsearch [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/maurosoria/dirsearch.git
echo -e "${END}"
echo -e "${YELLOW}[+] Cloning nmapAutomator [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/21y4d/nmapAutomator.git
echo -e "${END}"
echo -e "${YELLOW}[+] Cloning Bfac [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/mazen160/bfac.git
echo -e "${END}"
echo -e "${YELLOW}[+] Cloning GTFONow [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/Frissi0n/GTFONow.git
echo -e "${END}"
echo -e "${YELLOW}[+] Cloning JWTool [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/ticarpi/jwt_tool.git
sudo python3 -m pip install termcolor cprint pycryptodomex requests
echo -e "${END}"
echo -e "${YELLOW}[+] Cloning NoSQLMap [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/codingo/NoSQLMap.git
echo -e "${END}"
echo -e "${YELLOW}[+] Cloning GraphQLMap [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/swisskyrepo/GraphQLmap.git
echo -e "${END}"
echo -e "${YELLOW}[+] Cloning PHPGGC [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/ambionics/phpggc.git
echo -e "${END}"
cd ../Wordlists || exit
echo -e "${YELLOW}[+] Cloning SecLists [+]${END}"
echo -e "${CYAN}"
git clone https://github.com/danielmiessler/SecLists.git
echo -e "${END}"
echo -e "${PURPLE}[+] All repositories cloned [+]${END}"
}

installTools(){
echo -e "${YELLOW} [...] Installing other tools [...] ${END}"
echo -e "${CYAN}"
sudo apt-get install steghide -y
sudo apt-get install fcrackzip -y
echo -e "${END}"
echo -e "${PURPLE}[+] DONE [+] ${END}"
}

installScripts(){
cd ../LinuxScripts || exit
echo -e "${YELLOW} [...] Downloading Linux Scripts [...] ${END}"
echo -e "${CYAN}"
sudo wget https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh
sudo wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh
sudo wget https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh
sudo apt install libimage-exiftool-perl -y
echo -e "${END}"
}

cloneRepo
installTools
installScripts

echo -e "${RED}[+] EXITING... [+] ${END}"

exit 0
