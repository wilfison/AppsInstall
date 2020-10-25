#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Downloading installer... $close_color" &&
wget "https://telegram.org/dl/desktop/linux" -O ~/telegram.tar.xz &&

echo -e "$green Checking previous version... $close_color" &&
sudo rm -rf -f /opt/telegram* &&
sudo rm -rf -f /usr/bin/telegram &&
sudo rm -rf -f /usr/share/applications/telegram.desktop &&

echo -e "$green Installing... $close_color" &&
sudo tar Jxf ~/telegram.tar.xz -C /opt/ &&
sudo mv /opt/Telegram* /opt/telegram &&
sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
sudo chmod -R 777 /opt/telegram &&

echo '[Desktop Entry] 
Version=1.0 
Name=Telegram Desktop 
Comment=Official desktop application for the Telegram messaging service 
TryExec=$HOME/telegram/Telegram 
Exec=/opt/telegram/Telegram -- %u 
Icon=telegram 
Terminal=false 
StartupWMClass=TelegramDesktop 
Type=Application 
Categories=Network;InstantMessaging;Qt; 
MimeType=x-scheme-handler/tg; 
Keywords=tg;chat;im;messaging;messenger;sms;tdesktop; 
X-GNOME-UsesNotifications=true' | sudo tee /usr/share/applications/telegramdesktop.desktop &&

rm -f telegram.tar.xz &&

echo -e "$green Telegram successfully installed $close_color"
