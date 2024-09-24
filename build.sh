# Grabbing Dependencies before build
echo "Grabbing Dependencies before build"
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install dialog bash sed wget git curl zip tar jq expect make cmake automake autoconf llvm lld lldb binutils bison perl gperf gawk flex bc python3 zstd openssl unzip cpio bc bison build-essential ccache liblz4-tool libsdl1.2-dev libstdc++6 libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zlib1g-dev libncurses5-dev bzip2 git libssl-dev dos2unix kmod python2 -y

# Grabbing Bliss required Dependencies
echo "Grabbing Bliss required Dependencies"
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install git gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev-i386 lib32ncurses-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip squashfs-tools python3-mako libssl-dev ninja-build lunzip syslinux syslinux-utils gettext genisoimage gettext bc xorriso xmlstarlet -y

# Initialize ROM and clone Device manifests
echo ' Initialize ROM and Device manifests '
rm -rf .repo/local_manifests/ &&
repo init -u https://github.com/NusantaraProject-ROM/android_manifest -b 10
git clone https://github.com/nathannxx/local_manifests_nss.git --depth 1 -b nss .repo/local_manifests

# Sync the repositories
echo "Sync begin"
  repo sync -c --force-sync --no-tags --no-clone-bundle
repo sync --no-tags --no-clone-bundle --force-sync -j1 --fail-fast
echo 'Setup Environment begins'
. build/envsetup.sh

# Build the ROM
export BUILD_USERNAME=nathannxx
export BUILD_HOSTNAME=omkegams
echo "BUILD STARTS NOW !!!"
lunch nad_RMX1941-userdebug
mka nad -j
