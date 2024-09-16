rm -rf .repo/local_manifests/  &&
# Clone local_manifests repository
repo init -u https://github.com/ProjectBlaze/manifest.git -b 12.1 --git-lfs --depth=1
git clone https://github.com/nathannxx/local_manifest.git --depth 1 -b blaze .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=natehiggas
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export WITH_GMS=true
source build/envsetup.sh
 
# Build the ROM
lunch blaze_RMX1941-userdebug
mka installclean
mka bacon
