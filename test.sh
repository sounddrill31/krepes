# Clone local_manifests repository
repo init -u https://github.com/RisingTechOSS/android -b thirteen --git-lfs 
git clone https://github.com/nathannxx/android_device_realme_RMX1941/tree/aosp --depth 1 -b CrFuck device/realme/RMX1941
git clone https://github.com/P-Salik/android_kernel_realme_RMX1941 --depth 1 -b Q-rebase kernel/realme/RMX1941
git clone https://github.com/P-Salik/android_vendor_realme_RMX1941 --depth 1 -b tiramsu vendor/realme/RMX1941
git clone https://github.com/nathannxx/android_vendor_realme_RMX1941-ims.git --depth 1 -b 13.0 vendor/realme/RMX1941-ims
git clone https://github.com/P-Salik/android_prebuilts_clang_host_linux-x86_clang-5484270.git --depth 1 -b 9.0.3 prebuilts/clang/host/linux-x86/clang-r353983c
git clone https://github.com/P-Salik/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-gnu-7.5.git --depth 1 -b master prebuilts/gcc/linux-x86/aarch64/aarch64-linux-gnu-7.5
git clone https://github.com/ArrowOS/android_device_mediatek_sepolicy_vndr.git --depth 1 -b arrow-13.0 device/mediatek/sepolicy_vndr
git clone https://github.com/P-SalikAlt/platform_system_bpf.git --depth 1 -b android-13.0.0_r35 system/bpf
git clone https://gitlab.com/tejas101k/clang-r450784d.git --depth 1 -b master prebuilts/clang/host/linux-x86/clang-r450784d
git clone https://gitlab.com/PixelBuilds/android_vendor_gms.git --depth 1 -b unity vendor/gms
git clone https://github.com/RisingTechOSS/android_vendor_rising.git --depth 1 -b thirteen vendor/lineage
git clone https://github.com/LineageOS/android_prebuilts_build-tools.git --depth 1 -b lineage-20.0 prebuilts/build-tools
git clone https://github.com/nathannxx/android_vendor_qcom_opensource_vibrator --depth 1 -b lineage-20.0 vendor/qcom/opensource/vibrator

# Sync the repositories
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

# resync
repo sync --no-tags --no-clone-bundle --force-sync -j1 --fail-fast

# Set up build environment
export BUILD_USERNAME=nathannxx 
export BUILD_HOSTNAME=YouDeer
. build/envsetup.sh

# Build the ROM
lunch lineage_RMX1941-userdebug && brunch RMX1941
