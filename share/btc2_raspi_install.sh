#!/bin/bash
clear
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo -e "\e[1m################################################################################"
echo "################################################################################"
echo ""
echo "              THIS SCRIPT WILL INSTALL THE BITCOIN 2 CORE WALLET,"
echo "              CONFIGURE AND SECURE YOUR RASPBIAN OPERATING SYSTEM"
echo ""
echo -e "      \e[31m\e[1m/!\ IT MAY TAKE A LONG TIME /!\ DON'T TURN OFF YOUR RASPBERRY PI /!\ \e[0m"                  
echo ""
echo -e "                           \e[1m\e[5mPRESS ANY KEY TO CONTINUE\e[0m"
echo ""
echo -e "\e[1m################################################################################"
echo -e "################################################################################\e[0m"
read -n 1 -s -r -p ""

clear
echo -e "\e[1m################################################################################"
echo "                               UPDATING SYSTEM"
echo -e "################################################################################\e[0m"
echo ""
sudo apt-get update
echo ""
echo -e "\e[92mDone...\e[0m"
sleep 1

echo ""
echo -e "\e[1m################################################################################"
echo "                               UPGRADING SYSTEM"
echo -e "################################################################################\e[0m"
echo ""

sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt -y autoremove
echo ""
echo -e "\e[92mDone...\e[0m"
sleep 1

echo ""
echo -e "\e[1m################################################################################"
echo "                        CONFIGURING FIREWALL WITH UFW"
echo -e "################################################################################\e[0m"
echo ""

sudo apt-get install -y ufw
sudo ufw allow 8333
sudo ufw allow ssh
sudo ufw allow vnc
sudo ufw enable
sudo ufw status
echo -e "\e[92mDone...\e[0m"
sleep 1

echo ""
echo -e "\e[1m################################################################################"
echo "                      DOWNLOADING BITCOIN 2 CORE WALLET"
echo -e "################################################################################\e[0m"
echo ""

cd /usr/local/bin
sudo wget https://github.com/BITC2/bitcoin2/releases/download/2.1.5/bitcoin2-2.1.5-arm-linux-gnueabihf.tar.gz
echo ""
echo -e "\e[92mDone...\e[0m"
sleep 1

echo ""
echo -e "\e[1m################################################################################"
echo "              INSTALLING BITCOIN 2 CORE WALLET in /usr/local/bin/"
echo -e "################################################################################\e[0m"
echo ""
sudo tar -zxvf bitcoin2-2.1.5-arm-linux-gnueabihf.tar.gz
sudo mv -f bitcoin2-2.1.5/bin/* /usr/local/bin
sudo rm -rf bitcoin2-2.1.5*
echo ""
echo -e "\e[92mDone...\e[0m"
sleep 1

echo ""
echo -e "\e[1m################################################################################"
echo "                      CONFIGURING BITCOIN 2 CORE WALLET "
echo -e "################################################################################\e[0m"
echo ""
cd ~
if [ -d ".bitcoin2/" ];then
echo -e "\e[31m\e[1m\e[5m/!\ A previous installation of Bitcoin 2 has been detected /!\ \e[0m"
echo -e "\e[31m\e[1mDo you want to overwrite the .bitcoin2 directory ?"
echo -e "Anyway your wallet.dat will be restored.\e[0m"
echo -e "\e[1mPlease answer YES or NO, then press ENTER\e[0m";
while true; do
   read yn;
    case $yn in
        [Yy]* ) echo -e "\e[92mBacking up wallet.dat file...\e[0m";
        mv -f .bitcoin2/wallet.dat wallet.dat;
        sleep 1;
        echo -e "\e[92mDeleting old .bitcoin2 config folder...\e[0m";
        rm -rf .bitcoin2/;
        sleep 1;
        echo -e "\e[92mCreating new .bitcoin2 config folder...\e[0m"
        mkdir .bitcoin2/;
        echo -e "\e[92mRestoring wallet.dat file...\e[0m";
        mv -f wallet.dat .bitcoin2/wallet.dat;
        sleep 1; break;;
        [Nn]* ) echo -e "\e[31m\e[1mExiting because .bitcoin2 directory exists...";
        echo -e "Please backup your wallet.dat and remove the directory manually before";
        echo -e "proceeding with this script.\e[0m";
        echo -e "\e[1m\e[5mPRESS ANY KEY TO EXIT\e[0m"; read -n 1 -s -r -p ""; exit 0;;
        * ) echo -e "\e[31m\e[1m\e[5mPlease answer YES or NO, then press ENTER\e[0m";;
    esac
done
else
echo -e "\e[92mCreating .bitcoin2 config folder...\e[0m";
mkdir .bitcoin2/;
sleep 1;
fi
echo -e "\e[92mCreating bitcoin2.conf...\e[0m"
cd .bitcoin2
echo "rpcuser=User"`shuf -i 1000000-1000000000 -n 1` >> bitcoin2.conf
echo "rpcpassword=Pass"`shuf -i 1000000-1000000000 -n 1` >> bitcoin2.conf
echo "rpcallowip=127.0.0.1" >> bitcoin2.conf
echo "listen=1" >> bitcoin2.conf
echo "server=1" >> bitcoin2.conf
echo "daemon=1" >> bitcoin2.conf
echo "logtimestamps=1" >> bitcoin2.conf
echo "upnp=1" >> bitcoin2.conf
echo "maxconnections=32" >> bitcoin2.conf
sleep 1
echo ""
echo -e "\e[92mDone...\e[0m"
sleep 1

echo ""
echo -e "\e[1m################################################################################"
echo "           DOWNLOADING BITCOIN 2 BLOCKCHAIN SNAPSHOT (June 8 2019)"
echo -e "     \e[31m\e[1m\e[5m/!\ IT MAY TAKE A LONG TIME /!\ DON'T TURN OFF YOUR RASPBERRY PI /!\ \e[0m"                  
echo -e "\e[1m################################################################################\e[0m"
echo ""

wget https://www.bitc2.org/snapshot-june-8-2019.zip
unzip snapshot-june-8-2019.zip
rm snapshot-june-8-2019.zip
rm SnapshotReadMe.txt
echo ""
echo -e "\e[92mDone...\e[0m"
sleep 1

echo ""
echo -e "\e[1m################################################################################"
echo "                    CREATING BITCOIN 2 CORE DESKTOP SHORTCUT"
echo -e "################################################################################\e[0m"
echo ""

cd /usr/share/icons
sudo mkdir bitcoin2
cd bitcoin2
sudo wget https://www.bitc2.org/img/bitcoin2_logo256.png
cd ~/Desktop
echo "[Desktop Entry]" >> "Bitcoin 2 Core.desktop"
echo "Name=Bitcoin 2 Core" >> "Bitcoin 2 Core.desktop"
echo "Icon=/usr/share/icons/bitcoin2/bitcoin2_logo256.png" >> "Bitcoin 2 Core.desktop"
echo "Exec=/usr/local/bin/bitcoin2-qt" >> "Bitcoin 2 Core.desktop"
echo "Type=Application" >> "Bitcoin 2 Core.desktop"
echo "Encoding=UTF-8" >> "Bitcoin 2 Core.desktop"
echo "Terminal=false" >> "Bitcoin 2 Core.desktop"
echo "Categories=None" >> "Bitcoin 2 Core.desktop"
echo ""
echo -e "\e[92mDone...\e[0m"
sleep 1

clear
echo ""
echo ""
echo -e "\e[1m################################################################################"
echo "################################################################################"
echo ""
echo -e "               YOUR BITCOIN 2 CORE WALLET IS ABOUT TO BE READY"
echo ""
echo -e "   \e[91m\e[1m/!\ Your IP address will be mandatory to start VNC from your computer /!\ \e[0m " 
echo ""
ip4eth0=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
ip4wlan0=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)
[[ -z "$ip4eth0" ]] || echo -e '   \e[1m\e[92mLAN IP ADDRESS :' $ip4eth0'\e[0m';
[[ -z "$ip4wlan0" ]] || echo -e '   \e[1m\e[92mWLAN IP ADDRESS :' $ip4wlan0'\e[0m';
echo -e "\e[0m"
echo -e "   \e[1mAfter the reboot, you will be able to unplug HDMI, keyboard and mouse"
echo "   Take remote control from your computer with VNC Viewer"
echo "   Launch the Bitcoin 2 Core Wallet desktop shortcut "
echo "   Wait until the end of the synchronization"
echo -e "   And enjoy your Bitcoin 2 Staking Raspberry Pi !\e[0m"
echo ""
echo -e "                            \e[1m\e[5mPRESS ENTER TO REBOOT\e[0m"
echo ""
echo -e "\e[1m################################################################################"
echo -e "################################################################################\e[0m"
read a

echo "Starting VNC service..."
sudo systemctl enable vncserver-x11-serviced.service
sleep 1

echo "Increasing SWAP size to 2Gb..."
sudo sed -i -r 's/.*CONF_SWAPSIZE.*/CONF_SWAPSIZE=2048/g' /etc/dphys-swapfile
sleep 1

echo "Forcing HD 1080p resolution..."
sudo sed -i -r 's/.*hdmi_group.*/hdmi_group=2/g' /boot/config.txt
sudo sed -i -r 's/.*hdmi_mode.*/hdmi_mode=82/g' /boot/config.txt
sleep 1

echo "Disabling splash screens..."
sudo mount /dev/mmcblk0p1 /mnt
sudo sh -c "echo 'disable_splash=1' >> /mnt/config.txt"
sudo sed -i -e "s/splash //g" /boot/cmdline.txt
sleep 1

echo "Disabling screen saver..."
sudo sed -i -r 's/.*xserver-command=X.*/xserver-command=X -s 0 -dpms/g' /etc/lightdm/lightdm.conf
sleep 1

echo "Disabling auto login..."
sudo sed -i -r 's/.*autologin-user=.*/#autologin-user=pi/g' /etc/lightdm/lightdm.conf
sleep 1

echo "Rebooting..."
sleep 3

cat /dev/null > ~/.bash_history && history -cw
sudo reboot
