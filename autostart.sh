#!/bin/bash
while [[ ! $(pidof 9hbot) ]]; do
        killall 9hbrowser 9htl
        Xvfb :1 & export DISPLAY=:1 && /root/9Hits-bot/9HitsViewer-bot/9hbot > /dev/null
        exit
done
