rm -rf .repo/local_manifests/
# Clone local_manifests repository
echo " Cloning Manifests "
repo init -u https://github.com/NusantaraProject-ROM/android_manifest -b 10
git clone https://github.com/nathannxx/local_manifests_treble --depth 1 -b treble .repo/local_manifests

# Sync the repositories
echo " LET THAT SYNC IN "
# Check if we're running on Crave
if [ -f /opt/crave/resync.sh ]; then
    # If it exists, run the script
    /opt/crave/resync.sh
else
    # We're running on a normal system
    repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
fi
# Set up build environment
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
