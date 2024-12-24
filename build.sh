# Initialize ROM and clone Device manifests
echo ' Initialize ROM and Device manifests '
rm -rf .repo/local_manifests/ &&
repo init -u https://github.com/nathannxx/android_manifest.git -b 12
git clone https://github.com/nathannxx/local_manifests_nss.git --depth 1 -b nss .repo/local_manifests

# Sync the repositories
echo "Sync begin"
# Check if we're running on Crave
if [ -f /opt/crave/resync.sh ]; then
    # If it exists, run the script
    /opt/crave/resync.sh
else
    # We're running on a normal system
    repo sync --no-tags --no-clone-bundle --force-sync -j1 --fail-fast
fi
echo 'Setup Environment begins'
. build/envsetup.sh

# Build the ROM
export BANANA_MAINTAINER=nathan:3
export BUILD_USERNAME=nathannxx
export BUILD_HOSTNAME=omkegams
echo "BUILD STARTS NOW !!!"
lunch banana_RMX1941-userdebug
m banana
