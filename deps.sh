# This Python installer will check what Ubuntu version is running
# and make sure it installed properly
# this is needed for repo script and also on older ubuntu versions ( lower than 23.04 )
echo 'Installing Required tools..'
sudo apt install python3
wget https://raw.githubusercontent.com/nathannxx/gabut/refs/heads/main/ularpiton.py
python3 ularpiton.py
clear

# Installing Dependencies that are needed for building
# yeah i know it's too much, but you can remove it as you need it
echo 'installing packages'
sleep 2
echo 'package 1'
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install dialog bash sed wget git curl zip tar jq expect make cmake automake autoconf llvm lld lldb binutils bison perl gperf gawk flex bc python3 zstd openssl unzip cpio bc bison build-essential ccache liblz4-tool libsdl1.2-dev libstdc++6 libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zlib1g-dev libncurses5-dev bzip2 git libssl-dev dos2unix kmod python2 -y
echo 'package 2'
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install git gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev-i386 lib32ncurses-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip squashfs-tools python3-mako libssl-dev ninja-build lunzip syslinux syslinux-utils gettext genisoimage gettext bc xorriso xmlstarlet -y
echo 'package 3'
sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev -y && sudo apt-get update -y && sudo apt-get upgrade -y
clear

echo 'Installing Repo Tools..'
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo 'done, you can enjoy build Custom ROM'
sleep 3
echo 'Closing in 5'
sleep 
echo 'Closing in 4'
sleep 3
echo 'Closing in 3'
sleep 3
echo 'Closing in 2'
sleep 3
echo 'Closing in 1'
sleep 3
echo 'Enjoy :D'
sleep 2
clear
