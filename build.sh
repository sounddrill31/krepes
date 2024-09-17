rm -rf .repo/local_manifests/  &&
# Clone local_manifests repository
repo init -u https://github.com/ProjectBlaze/manifest.git -b 12.1 --git-lfs --depth=1
# Cloning Depis Teri
git clone https://github.com/nathannxx/android_device_realme_RMX1941 --depth 1 -b twelve device/realme/RMX1941; \
git clone https://github.com/P-Salik/android_kernel_realme_RMX1941 --depth 1 -b Q-rebase kernel/realme/RMX1941; \
git clone https://github.com/P-Salik/android_vendor_realme_RMX1941 --depth 1 -b Sv2 vendor/realme/RMX1941; \
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
