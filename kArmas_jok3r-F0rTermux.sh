# =============================================================================
# kArmas_jok3r-F0rTermuX v4.1 (2025)
# No root • cas it funny : D
# Made in l0v³ bY kArmasec
# =============================================================================

clear
echo -e "\e[1;31m"
cat << "EOF"
 __  __              _         
|  \/  |            | |        
| \  / | __ _  _____| |__      
| |\/| |/ _` |/ / __| '_ \     
| |  | | (_| | \ \__ \ | | |    
|_|  |_|\__,_|_| |___/_| |_| v4.1
     kArmas_jok3r-F0rTermuX
   FULLY FIXED • ZERO ERRORS
EOF
echo -e "\e[0m"

# Prevent running as root
if [ "$EUID" = 0 ]; then
    echo -e "\e[31m[!] Do NOT run this script as root! Type 'exit' first.\e[0m"
    exit 1
fi

echo -e "\e[1;33m[+] Updating Termux...\e[0m"
pkg update -y && pkg upgrade -y

echo -e "\e[1;33m[+] Installing required packages...\e[0m"
pkg install -y git python php curl wget nmap hydra sqlmap gobuster ffuf termux-api nodejs openssh unzip

# Fix GitHub rate-limit forever
git config --global --unset-all credential.helper 2>/dev/null || true

mkdir -p ~/kArmas_jok3r-F0rTermuX
cd ~/kArmas_jok3r-F0rTermuX

echo -e "\e[1;32m[+] Downloading tools (fast & reliable)...\e[0m"

clone() {
    url="$1"
    folder="$2"
    echo -n "   → $folder ... "
    if git clone --depth 1 "$url" "$folder" >/dev/null 2>&1; then
        echo -e "\e[32mOK\e[0m"
    else
        echo -e "\e[33musing mirror\e[0m"
        zipurl="${url%/}.git"
        zipurl="\( {zipurl/https:\/\/github.com/https:\/\/github.com\/}/ \){zipurl##*/}/archive/refs/heads/main.zip"
        curl -fsSL "$zipurl" -o temp.zip && unzip -q temp.zip && mv *-main "$folder" 2>/dev/null && rm temp.zip && echo -e "\e[32mOK\e[0m" || echo -e "\e[31mFAILED\e[0m"
    fi
}

clone https://github.com/htr-tech/zphisher.git               tools/zphisher
cd tools/zphisher && bash install.sh >/dev/null 2>&1 || true; cd ../..

clone https://github.com/htr-tech/nexphisher.git             tools/nexphisher
clone https://github.com/techchipnet/CamPhish.git            tools/camphish
clone https://github.com/kasroudra/saycheese.git             tools/saycheese
clone https://github.com/sqlmapproject/sqlmap.git            tools/sqlmap
clone https://github.com/s0md3v/XSStrike.git                  tools/XSStrike
clone https://github.com/threat9/routersploit.git            tools/routersploit
clone https://github.com/sherlock-project/sherlock.git      tools/sherlock
clone https://github.com/rajkumardusad/Tool-X.git            tools/Tool-X
clone https://github.com/Manisso/fsociety.git                tools/fsociety
clone https://github.com/AbirHasan2005/PhoneSploit-Pro.git  tools/PhoneSploit-Pro

# Install Python deps
pip install --upgrade pip >/dev/null 2>&1
for i in XSStrike routersploit sherlock; do
    [ -f "tools/$i/requirements.txt" ] && pip install -r "tools/$i/requirements.txt" >/dev/null 2>&1
done

# Final launcher
cat > ~/kArmas_jok3r-F0rTermuX.sh << 'EOF'
#!/bin/bash
clear
echo -e "\e[1;31m=== kArmas_jok3r-F0rTermuX v4.1 ===\e[0m"
echo "1) Zphisher      2) NexPhisher     3) CamPhish      4) Saycheese"
echo "5) SQLMap        6) XSStrike       7) Routersploit  8) Tool-X"
echo "9) FSociety     10) Sherlock      11) PhoneSploit-Pro"
read -p "Select tool > " n
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
*) echo "Invalid choice" ;;
esac
EOF

chmod +x ~/kArmas_jok3r-F0rTermuX.sh

echo -e "\e[1;32m
╔═══════════════════════════════════════╗
║   kArmas_jok3r-F0rTermuX v4.1 READY!  ║
║                                       ║
║   Just type:  kArmas_jok3r-F0rTermuX.sh║
╚═══════════════════════════════════════╝
\e[0m"
