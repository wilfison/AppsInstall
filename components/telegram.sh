#!/bin/bash

source $(dirname "$0")/helpers/colors.sh

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
echo '[Desktop Entry]\n Version=1.0\n Name=Telegram Desktop\n Comment=Official desktop application for the Telegram messaging service\n TryExec=/home/william/telegram/Telegram\n Exec=/opt/telegram/Telegram -- %u\n Icon=telegram\n Terminal=false\n StartupWMClass=TelegramDesktop\n Type=Application\n Categories=Network;InstantMessaging;Qt;\n MimeType=x-scheme-handler/tg;\n Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;\n X-GNOME-UsesNotifications=true' | sudo tee /usr/share/applications/telegramdesktop.desktop &&
rm -f telegram.tar.xz &&

echo -e "$green Telegram successfully installed $close_color"