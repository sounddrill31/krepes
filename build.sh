rm -rf .repo/local_manifests/  &&
# Clone local_manifests repository
repo init -u https://github.com/xdroid-oss/xd_manifest -b twelve --git-lfs; \
# Cloning Depis Teri
git clone https://github.com/nathannxx/android_device_realme_RMX1941 --depth 1 -b twelve device/realme/RMX1941; \
git clone https://github.com/P-Salik/android_kernel_realme_RMX1941 --depth 1 -b Q-rebase kernel/realme/RMX1941; \
git clone https://github.com/P-Salik/android_vendor_realme_RMX1941 --depth 1 -b Sv2 vendor/realme/RMX1941; \
# Sync the repositories
/opt/crave/resync.sh; \
source build/envsetup.sh; \
# Set up build environment
export BUILD_USERNAME=natehiggas
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export WITH_GMS=true
 
# Build the ROM
breakfast RMX1941 userdebug; \
mka installclean
mka bacon
