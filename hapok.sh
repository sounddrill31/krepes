# Initialize ROM and clone Device manifests
echo ' Initialize ROM and Device manifests '
rm -rf .repo/local_manifests/ &&
repo init -u https://github.com/Havoc-OS-Revived/android_manifest.git -b eleven --git-lfs
git clone https://github.com/nathannxx/local_manifests_hfc --depth 1 -b hfc .repo/local_manifests

# Sync the repositories
echo "Sync begin"
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

repo sync --no-tags --no-clone-bundle --force-sync -j1 --fail-fast
echo 'Setup Environment begins'
. build/envsetup.sh

# Build the ROM
export BUILD_USERNAME=nathannxx
export BUILD_HOSTNAME=omkegams
echo "BUILD STARTS NOW !!!"
lunch havoc_RMX1941-userdebug
m bacon
