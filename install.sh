#!/bin/bash
mkdir /root/9Hits-bot/
cd /root/9Hits-bot/
if [[ $EUID -ne 0 ]]; then
    whiptail --title "ERROR" --msgbox "This script must be run as root" 8 78
    exit
else
    new=$(whiptail --title "Do you want clean install or use you config file?" --menu "Choose an option" 16 100 9 \
        "1)" "Clean"   \
        "2)" "Use my config"   3>&2 2>&1 1>&3
        )
    case $new in
        "1)")
            new=1
            ;;
        "2)")
            new=2
            ;;
    esac
    apt-get install -y xvfb wget libgtk-3-0 libatspi2.0-0 libatomic1 libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev libgconf-2-4 libatk1.0-0 libatk-bridge2.0-0 libgdk-pixbuf2.0-0 libgbm-dev libnss3-dev
    wget https://www.dropbox.com/s/df2y8zpvhc3zap8/9hits-bot-linux-x64.tar.bz2
    tar -xjvf 9hits-bot-linux-x64.tar.bz2
    mv /root/9Hits-bot/9hits-bot-linux-x64 /root/9Hits-bot/9HitsViewer-bot
    rm -rf 9hits-bot-linux-x64.tar.bz2 9hits-bot-linux-x64
    if [ $new == "2" ]; then
        rm -rf 9HitsViewer-bot/config
        cp -r /root/config 9HitsViewer-bot/config
    fi
    mv /root/9Hbot-NoGui/* /root/9Hits-bot/
    chmod +x -R /root/9Hits-bot/
    rm -r /root/9Hbot-NoGui
    crontab crontab
fi
