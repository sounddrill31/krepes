rm -rf .repo/local_manifests/  &&
# Clone local_manifests repository
repo init -u https://github.com/BlissRoms/platform_manifest.git -b arcadia-next --git-lfs
# Cloning Depis Teri
git clone https://github.com/nathannxx/android_device_realme_RMX1941 --depth 1 -b bless device/realme/RMX1941
git clone https://github.com/P-Salik/android_kernel_realme_RMX1941 --depth 1 -b Q-rebase kernel/realme/RMX1941
git clone https://github.com/P-Salik/android_vendor_realme_RMX1941 --depth 1 -b Sv2 vendor/realme/RMX1941
git clone https://github.com/P-Salik/vendor_realme_RMX1941-ims.git --depth 1 -b lineage-20 vendor/realme/RMX1941-ims
# Sync the repositories
/opt/crave/resync.sh
. build/envsetup.sh
# Set up build environment
export BUILD_USERNAME=natehiggas
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
 
# Build the ROM
echo ' BUILD STARTS NOW !!! '
blissify -c RMX1941
