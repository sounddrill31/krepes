echo " TERMUX-X11 + PROOT-DISTRO AUTO INSTALLER BY NATHANXX "
pkg update
pkg install x11-repo
pkg install xwayland xorg-server-xvfb
dpkg -i termux-x11.deb
echo 'allow-external-apps = true' >> ~/.termux/termux.properties
termux-reload-settings
pkg install proot-distro pulseaudio vim
echo "pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
" > ~/.profile
nano ~/.profile

echo " FINISH INSTALLING, ENJOY!!! "
