#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/Bauskaj/me/main/ws/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/Bauskaj/me/main/ws/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt

#isi data
clear
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @RajasaVPN
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt
systemctl enable kyt
systemctl restart kyt
cd /root
rm -rf kyt.sh
clear
sleep 3
fun_bar() {
        CMD[0]="$1"
        CMD[1]="$2"
        (
            [[ -e $HOME/fim ]] && rm $HOME/fim
            ${CMD[0]} -y >/dev/null 2>&1
            ${CMD[1]} -y >/dev/null 2>&1
            touch $HOME/fim
        ) >/dev/null 2>&1 &
        tput civis
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
        while true; do
            for ((i = 0; i < 8; i++)); do
                echo -ne "🌐"
                sleep 0.1s
            done
            [[ -e $HOME/fim ]] && rm $HOME/fim && break
            echo -e "\033[0;33m]"
            sleep 1s
            tput cuu1
            tput dl1
            echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
        done
        echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
        tput cnorm
    }
    sssssss() {
        sleep 5
    }
    sssssssss() {
        sleep 5
    }
    ssssssssssss() {
        sleep 2
    }

    echo -e "  ${OR}──────────────────────────────────────${NC}"
    printf "\e[1;92m   .::.\e[0m\e[1;77mBOT PANEL TELEGRAM \e[1;92m.::.\e[0m\n"
    echo -e "  ${OR}──────────────────────────────────────${NC}"
    echo -e ""
    echo -e "Setting up Telegram BOT"
    fun_bar 'sssssss'
    echo -e "Input Data API TOKEN"
    fun_bar 'sssssssss'
    echo -e "Input your ID"
    fun_bar 'ssssssssssss'
    echo -e ""
    echo -e ""
    clear
    BOTTSSSTT=$(systemctl status kyt | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
    if [[ $BOTTSSSTT == "running" ]]; then
        BOTBOTTTTSUDADHTTT="${grenbo}🟢 Online${NC}"
    else
        BOTBOTTTTSUDADHTTT="${RED}🔴 Offline${NC}"
    fi
    echo -e "  ${OR}──────────────────────────────────────${NC}"
    echo -e "       YOUR 🤖BOT STATUS $BOTBOTTTTSUDADHTTT"
    echo -e "  ${OR}──────────────────────────────────────${NC}"
    echo -e "  You can start the bot with the command"
    echo -e "     (/menu Atau .menu) On your BOT"
    echo -e "       in other settings no.10"
    echo -e ""
echo " Installations complete, type /menu on your bot"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu