rm -rf .repo/local_manifests/
# Clone local_manifests repository
echo " Cloning Manifests "
repo init -u https://github.com/NusantaraProject-ROM/android_manifest -b 10
git clone https://github.com/nathannxx/local_manifests_treble --depth 1 -b treble .repo/local_manifests

# Sync the repositories
echo " LET THAT SYNC IN "
/opt/crave/resync.sh
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# Set up build environment
export USE_MICROG=true
export BUILD_USERNAME=nathannxx
export BUILD_HOSTNAME=pemburutempek
. build/envsetup.sh

sudo apt install cowsay -y
cowsay Let the jurney begins..

# Build the ROM
lunch treble_arm64_bvN-userdebug
make systemimage
cd out/target/product/phhgsi_arm64_ab/
zip -r9 nooz.zip system.img
curl bashupload.com -T nooz.zip
