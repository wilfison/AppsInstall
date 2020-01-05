#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Downloading installer... $close_color" &&
cd ~/ &&
wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz &&

echo -e "$green Checking previous version... $close_color" &&
sudo rm -rf -f /opt/telegram* &&
sudo rm -rf -f /usr/bin/telegram &&
sudo rm -rf -f /usr/share/applications/telegram.desktop &&

echo -e "$green Installing... $close_color" &&
sudo tar Jxf telegram.tar.xz -C /opt/ &&
sudo mv /opt/Telegram* /opt/telegram &&
sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
sudo chmod -R 777 /opt/telegram &&
echo '[Desktop Entry] \nVersion=1.0 \nName=Telegram Desktop \nComment=Official desktop application for the Telegram messaging service \nTryExec=$HOME/telegram/Telegram \nExec=/opt/telegram/Telegram -- %u \nIcon=telegram \nTerminal=false \nStartupWMClass=TelegramDesktop \nType=Application \nCategories=Network;InstantMessaging;Qt; \nMimeType=x-scheme-handler/tg; \nKeywords=tg;chat;im;messaging;messenger;sms;tdesktop; \nX-GNOME-UsesNotifications=true' | sudo tee /usr/share/applications/telegramdesktop.desktop &&
rm -f telegram.tar.xz &&

echo -e "$green Telegram successfully installed $close_color"