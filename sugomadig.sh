# Initialize ROM and clone Device manifests
echo ' Initialize ROM and Device manifests '
rm -rf .repo/local_manifests/ &&
repo init -u https://github.com/SigmaDroid-Project/manifest -b sigma-13 --git-lfs
git clone https://github.com/nathannxx/local_manifests_RMX1941.git --depth 1 -b RMX1941 .repo/local_manifests

# Sync the repositories
echo "Sync begin"
/opt/crave/resync.sh
echo 'Setup Environment begins'
. build/envsetup.sh

# Build the ROM
export WITH_GMS=true
export BUILD_USERNAME=nathannxx
export BUILD_HOSTNAME=omkegams
echo "BUILD STARTS NOW !!!"
lunch sigma_RMX1941-userdebug
make bacon
