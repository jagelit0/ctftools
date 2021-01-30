#!/bin/bash

PURPLE='\e[1;35m'
RED='\e[1;31m'
CYAN='\e[1;32m'
END='\e[0m'


echo -e "${PURPLE}"
echo -e "[*] Auto Install CTF Tools & Wordlists [*]"
echo -e "[*] Please, execute the script as sudo [*]"
echo -e "${END}"
read -p "Select where you want to install the script: " dirdown

if [ -z $dirdown ]; then
         echo -e "${RED}[!] Specify a directory, please [!] ${END}"
else
         mkdir -p $dirdown/
         mkdir -p $dirdown/Tools
         mkdir -p $dirdown/Wordlists
fi

cloneRepo(){
cd $dirdown/Tools
echo -e "${CYAN}"
echo -e "[+] Cloning Dirsearch [+]"
git clone https://github.com/maurosoria/dirsearch.git
echo -e "[+] Cloning nmapAutomator [+]"
git clone https://github.com/21y4d/nmapAutomator.git
echo -e "[+] Cloning GTFONow [+]"
git clone https://github.com/Frissi0n/GTFONow.git
echo -e "[+] Cloning JWTool [+]"
git clone https://github.com/ticarpi/jwt_tool.git
sudo pytho3 -m pip install termcolor cprint pycryptodomex requests
cd ../Wordlists
echo -e "[+] Cloning SecLists [+]"
git clone https://github.com/danielmiessler/SecLists.git
echo -e "[+] All repositories cloned [+]"
echo -e "${END}"
echo -e "${PURPLE}[+] DONE [+] ${END}"
}

installTools(){
echo -e "${CYAN} [...] Installing other tools [...] ${END}"
sudo apt-get install steghide -y
sudo apt-get install fcrackzip -y
echo -e "${PURPLE}[+] DONE [+] ${END}"
}

#cloneRepo
#installTools

echo -e "${RED}[+] EXITING... [+] ${END}"
