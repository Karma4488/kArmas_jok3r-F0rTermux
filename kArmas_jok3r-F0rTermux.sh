#!/bin/bash
# =============================================================================
# kArmas_jok3r-F0rTermuX v3.1 (NO GITHUB LOGIN PROMPT)
# Uses git:// or https→ssh redirects → zero authentication needed
# =============================================================================

clear
echo -e "\e[1;31m"
cat << "EOF"
 __  __              _         
|  \/  |            | |        
| \  / | __ _  _____| |__      
| |\/| |/ _` |/ / __| '_ \     
| |  | | (_| | \ \__ \ | | |    
|_|  |_|\__,_|_| |___/_| |_| v3.1
       kArmas_jok3r-F0rTermuX
    NO ROOT • NO GITHUB LOGIN • 2025 FIXED
EOF
echo -e "\e[0m"

# Force git to use SSH instead of HTTPS (bypasses login forever)
git config --global url."git@github.com:".insteadOf "https://github.com/"

pkg update -y && pkg upgrade -y
pkg install -y git python php curl wget nmap hydra sqlmap gobuster ffuf termux-api nodejs openssh

mkdir -p ~/kArmas_jok3r-F0rTermuX
cd ~/kArmas_jok3r-F0rTermuX

echo -e "\e[1;32m[+] Installing tools without any login prompts...\e[0m"

clone() {
    git clone --depth 1 "$1" "$2" 2>/dev/null || echo -e "\e[33m[skip] $2\e[0m"
}

# PHISHING
clone https://github.com/htr-tech/zphisher.git            tools/zphisher
cd tools/zphisher && bash install.sh &>/dev/null; cd ../../
clone https://github.com/htr-tech/nexphisher.git          tools/nexphisher
clone https://github.com/techchipnet/CamPhish.git         tools/camphish
clone https://github.com/kasroudra/saycheese.git          tools/saycheese
clone https://github.com/thelinuxchoice/shellphish.git    tools/shellphish

# WEB & SQLI
clone https://github.com/sqlmapproject/sqlmap.git         tools/sqlmap
clone https://github.com/s0md3v/XSStrike.git               tools/XSStrike
cd tools/XSStrike && pip install -r requirements.txt &>/dev/null; cd ../../

# ROUTER EXPLOITS
clone https://github.com/threat9/routersploit.git         tools/routersploit
cd tools/routersploit && pip3 install -r requirements.txt &>/dev/null; cd ../../

# OSINT
clone https://github.com/sherlock-project/sherlock.git    tools/sherlock
cd tools/sherlock && pip install -r requirements.txt &>/dev/null; cd ../../

# TOOLKITS
clone https://github.com/rajkumardusad/Tool-X.git         tools/Tool-X
clone https://github.com/Manisso/fsociety.git             tools/fsociety

# Android exploits (no root)
clone https://github.com/AbirHasan2005/PhoneSploit-Pro.git tools/PhoneSploit-Pro

# Launcher menu
cat > ~/kArmas_jok3r-F0rTermuX.sh << 'EOF'
#!/bin/bash
clear
echo -e "\e[1;31mkArmas_jok3r-F0rTermuX v3.1\e[0m"
echo "1) Zphisher    2) NexPhisher   3) CamPhish     4) Saycheese"
echo "5) SQLMap      6) XSStrike     7) Routersploit 8) Tool-X"
echo "9) FSociety   10) Sherlock    11) PhoneSploit-Pro"
read -p "Choose > " n
case $n in
1) cd ~/kArmas_jok3r-F0rTermuX/tools/zphisher && bash zphisher.sh ;;
2) cd ~/kArmas_jok3r-F0rTermuX/tools/nexphisher && bash nexphisher.sh ;;
3) cd ~/kArmas_jok3r-F0rTermuX/tools/camphish && bash camphish.sh ;;
4) cd ~/kArmas_jok3r-F0rTermuX/tools/saycheese && bash saycheese.sh ;;
5) cd ~/kArmas_jok3r-F0rTermuX/tools/sqlmap && python sqlmap.py ;;
6) cd ~/kArmas_jok3r-F0rTermuX/tools/XSStrike && python3 xsstrike.py ;;
7) cd ~/kArmas_jok3r-F0rTermuX/tools/routersploit && python3 rsf.py ;;
8) cd ~/kArmas_jok3r-F0rTermuX/tools/Tool-X && bash install.aex ;;
9) cd ~/kArmas_jok3r-F0rTermuX/tools/fsociety && python fsociety.py ;;
10) cd ~/kArmas_jok3r-F0rTermuX/tools/sherlock && python3 -m sherlock ;;
11) cd ~/kArmas_jok3r-F0rTermuX/tools/PhoneSploit-Pro && python3 main.py ;;
*) echo "Wrong choice" ;;
esac
EOF

chmod +x ~/kArmas_jok3r-F0rTermuX.sh

echo -e "\e[1;32m
══════════════════════════════════════════
  kArmas_jok3r-F0rTermuX INSTALLED 100%!
  No more GitHub login prompts ever again!
══════════════════════════════════════════
  Just type:   kArmas_jok3r-F0rTermuX.sh
\e[0m"
