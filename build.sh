# Initialize ROM and clone Device manifests
echo ' Initialize ROM and Device manifests '
rm -rf .repo/local_manifests/ &&
repo init --depth=1 -u https://github.com/Corvus-AOSP/android_manifest.git -b 12
git clone https://github.com/nathannxx/local_manifests_nss.git --depth 1 -b nss .repo/local_manifests

# Sync the repositories
echo "Sync begin"
repo sync -j$(nproc --all) --force-sync --no-tags --no-clone-bundle
repo sync --no-tags --no-clone-bundle --force-sync -j1 --fail-fast
echo 'Setup Environment begins'
. build/envsetup.sh

# Build the ROM
export BUILD_USERNAME=nathannxx
export BUILD_HOSTNAME=omkegams
echo "BUILD STARTS NOW !!!"
lunch corvus_RMX1941-userdebug
make corvus
