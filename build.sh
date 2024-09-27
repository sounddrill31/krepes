# Initialize ROM and clone Device manifests
echo ' Initialize ROM and Device manifests '
rm -rf .repo/local_manifests/ &&
repo init -u https://github.com/nathannxx/android_manifest.git -b 12
git clone https://github.com/nathannxx/local_manifests_nss.git --depth 1 -b nss .repo/local_manifests

# Sync the repositories
echo "Sync begin"
/opt/crave/resync.sh
echo 'Setup Environment begins'
. build/envsetup.sh

# Build the ROM
export BANANA_MAINTAINER=nathan:3
export BUILD_USERNAME=nathannxx
export BUILD_HOSTNAME=omkegams
echo "BUILD STARTS NOW !!!"
lunch banana_RMX1941-userdebug
m banana
