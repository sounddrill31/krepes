rm -rf .repo/local_manifests/  && 
# Clone local_manifests repository
repo init --depth=1 --no-repo-verify -u https://github.com/AfterLifePrjkt13/android_manifest.git -b LTS -g default,-mips,-darwin,-notdefault
git clone https://github.com/nathannxx/local_manifests_RMX1941 --depth 1 -b RMX1941 .repo/local_manifests && 

# Sync the repositories
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# resync
repo sync --no-tags --no-clone-bundle --force-sync -j1 --fail-fast

# Set up build environment
export BUILD_USERNAME=nathannxx 
export BUILD_HOSTNAME=YouDeer
. build/envsetup.sh

# Build the ROM
lunch afterlife_RMX1941-userdebug
m afterlife -j8
