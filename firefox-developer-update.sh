!/bin/sh

echo "Deletando quando versão antiga..."

sudo rm -Rf /opt/firefox-developer*
sudo rm -Rf /usr/bin/firefox-developer
sudo rm -Rf /usr/share/applications/firefox-developer.desktop

echo "Baixando e instalando a nova versão..."
wget "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=pt-BR" -O firefox-developer.tar.bz2
sudo tar -jxvf  firefox-developer.tar.bz2 -C /opt/
sudo mv /opt/firefox*/ /opt/firefox-developer
sudo ln -sf /opt/firefox-developer/firefox /usr/bin/firefox-developer
echo -e '[Desktop Entry]\n Version=77.0\n Encoding=UTF-8\n Name=Mozilla Firefox\n Comment=Navegador Web\n Exec=/opt/firefox-developer/firefox\n Icon=/opt/firefox-developer/browser/chrome/icons/default/default128.png\n Type=Application\n Categories=Network' | sudo tee /usr/share/applications/firefox-developer.desktop
sudo chmod +x /usr/share/applications/firefox-developer.desktop

echo "Baixando e instalando o updater..."
wget https://raw.githubusercontent.com/miqueiaspenha/firefox-developer-update/master/firefox-developer-update.sh
sudo mv firefox-developer-update.sh /opt/firefox-developer/firefox-developer-update.sh
sudo chmod +x /opt/firefox-developer/firefox-developer-update.sh
sudo ln -sf /opt/firefox-developer/firefox-developer-update.sh /usr/bin/firefox-developer-update
sudo chmod +x /opt/firefox-developer/firefox-developer-update.sh

echo "Deletando os arquivos baixados..."
sudo rm -Rf firefox-developer.tar.bz2

echo "Firefox Developer instalado!"