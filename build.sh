# Grabbing Dependencies before build
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install dialog bash sed wget git curl zip tar jq expect make cmake automake autoconf llvm lld lldb binutils bison perl gperf gawk flex bc python3 zstd openssl unzip cpio bc bison build-essential ccache liblz4-tool libsdl1.2-dev libstdc++6 libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zlib1g-dev libncurses5-dev bzip2 git libssl-dev dos2unix kmod python2 -y

# Grabbing Bliss required Dependencies
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip squashfs-tools python-mako libssl-dev ninja-build lunzip syslinux syslinux-utils gettext genisoimage gettext bc xorriso xmlstarlet -y

# Cleanup
rm -rf device/realme/RMX1941
rm -rf kernel/realme/RMX1941
rm -rf vendor/realme/RMX1941
rm -rf vendor/realme/RMX1941-ims

# Initialize ROM Repo
repo init -u https://github.com/BlissRoms/platform_manifest.git -b arcadia-next --git-lfs

# Cloning Depis Teri
git clone https://github.com/nathannxx/android_device_realme_RMX1941 --depth 1 -b bless device/realme/RMX1941
git clone https://github.com/P-Salik/android_kernel_realme_RMX1941 --depth 1 -b Q-rebase kernel/realme/RMX1941
git clone https://github.com/P-Salik/android_vendor_realme_RMX1941 --depth 1 -b Sv2 vendor/realme/RMX1941
git clone https://github.com/P-Salik/vendor_realme_RMX1941-ims.git --depth 1 -b lineage-20 vendor/realme/RMX1941-ims
echo 'Cloning tree success !!, Now syncing will begin shortly'

# Sync the repositories
/opt/crave/resync.sh && 
repo sync -c --force-sync --no-tags --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
echo 'Sync Success!!'
. build/envsetup.sh

# Set up build environment
export BUILD_USERNAME=natehiggas
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
 
# Build the ROM
echo 'BUILD STARTS NOW !!!'
blissify -g -d RMX1941
