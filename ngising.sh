rm -rf .repo/local_manifests/  && 
# Clone local_manifests repository
repo init -u https://github.com/RisingTechOSS/android -b thirteen --git-lfs 
git clone https://github.com/nathannxx/local_manifests_ngising --depth 1 -b ngising .repo/local_manifests && 

# Sync the repositories
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

# resync
repo sync --no-tags --no-clone-bundle --force-sync -j1 --fail-fast

# Set up build environment
export BUILD_USERNAME=nathannxx 
export BUILD_HOSTNAME=YouDeer
# RisingOS spesifics
export RISING_CHIPSET="Helio P22"
export RISING_MAINTAINER="nathannxx"
export RISING_PACKAGE_TYPE="VANILLA AOSP"
export RISING_BATTERY=4000 mAh
export TARGET_ENABLE_BLUR=false
export TARGET_HAS_UDFPS=false
export TARGET_USE_PIXEL_FINGERPRINT=false
. build/envsetup.sh

# Build the ROM
lunch lineage_RMX1941-userdebug && brunch RMX1941
