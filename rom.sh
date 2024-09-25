sudo apt-get update -y && sudo apt-get install dialog bash sed wget git curl zip tar jq expect make cmake automake autoconf llvm lld lldb clang gcc binutils bison perl gperf gawk flex bc python3 zstd openssl unzip cpio bc bison build-essential ccache liblz4-tool libsdl1.2-dev libstdc++6 libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zlib1g-dev libncurses5-dev bzip2 git gcc g++ libssl-dev gcc-aarch64-linux-gnu gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi dos2unix kmod python2 tree -y

rm -rf .repo/local_manifests/
find . -delete

repo init -u https://github.com/crdroidandroid/android -b 10.0 --depth=1

mkdir -p .repo/local_manifests
wget -O .repo/local_manifests/roomservice.xml https://raw.githubusercontent.com/Frostleaft07/krepes/refs/heads/main/roomservice.xml

/opt/crave/resync.sh ; repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8


git clone --depth=1 https://github.com/Frostleaft07/device_realme_RMX2185 -b nightmare device/realme/RMX2185
git clone --depth=1 https://github.com/Frostleaft07/vendor_realme_RMX2185 -b nightmare vendor/realme/RMX2185
git clone --depth=1 https://github.com/Frostleaft07/android_kernel_realme_mt6765 kernel/realme/mt6765
git clone https://github.com/Frostleaft07/keys -b crQ vendor/extra

ls build
tree device/realme
source build/env*.sh

rm -rf packages/apps/ManagedProvisioning
git clone --depth=1 https://android.googlesource.com/platform/packages/apps/ManagedProvisioning -b android10-release packages/apps/ManagedProvisioning

export BUILD_USERNAME=Frost
export BUILD_HOSTNAME=otsu-builder
export TZ=Asia/Jakarta
export LOCALVERSION=" CRDROID"

lunch lineage_RMX2185-userdebug
brunch RMX2185
