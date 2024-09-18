# Installing dependencies before build
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip squashfs-tools python-mako libssl-dev ninja-build lunzip syslinux syslinux-utils gettext genisoimage gettext bc xorriso xmlstarlet -y

rm -rf .repo/local_manifests/  &&
# Clone local_manifests repository
repo init -u https://github.com/BlissRoms/platform_manifest.git -b arcadia-next --git-lfs
# Cloning Depis Teri
git clone https://github.com/nathannxx/android_device_realme_RMX1941 --depth 1 -b twelve device/realme/RMX1941
git clone https://github.com/P-Salik/android_kernel_realme_RMX1941 --depth 1 -b Q-rebase kernel/realme/RMX1941
git clone https://github.com/P-Salik/android_vendor_realme_RMX1941 --depth 1 -b Sv2 vendor/realme/RMX1941
# Sync the repositories
/opt/crave/resync.sh
. build/envsetup.sh
# Set up build environment
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BUILD_USERNAME=natehiggas
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
 
# Build the ROM
echo ' BUILD STARTS NOW !!! '
blissify -c RMX1941
