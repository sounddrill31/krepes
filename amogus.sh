# Cleanup
rm -rf device/realme/RMX1941
rm -rf kernel/realme/RMX1941
rm -rf vendor/realme/RMX1941
rm -rf vendor/realme/RMX1941-ims

# Initialize ROM Repo
repo init -u https://github.com/AmogOS-Rom/android_manifest/ -b thirteen --git-lfs

# Cloning Depis Teri
git clone https://github.com/nathannxx/android_device_realme_RMX1941 --depth 1 -b amogus device/realme/RMX1941
git clone https://github.com/nathannxx/android_kernel_realme_RMX1941 --depth 1 -b Q-rebase kernel/realme/RMX1941
git clone https://github.com/nathannxx/android_vendor_realme_RMX1941 --depth 1 -b tiramsu vendor/realme/RMX1941
git clone https://github.com/P-Salik/vendor_realme_RMX1941-ims.git --depth 1 -b lineage-20 vendor/realme/RMX1941-ims
echo 'Cloning tree success !!, Now syncing will begin shortly'

# Sync the repositories
/opt/crave/resync.sh && 
echo 'Sync Success!!'
unset GAPPS
export AMOGOS_MAINTAINER=NateHiggas00
. build/envsetup.sh

# Set up build environment
export BUILD_USERNAME=natehiggas
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta

# remove gheyness of some rarts
rm -rf android_vendor_qcom_opensource_packages_apps_Bluetooth
rm -rf android_vendor_qcom_opensource_system_bt
rm -rf android_vendor_qcom_opensource_bluetooth_ext
rm -rf android_hardware_xiaomi
 
# Build the ROM
echo 'BUILD STARTS NOW !!!'
lunch lmodroid_RMX1941-userdebug
m bacon
