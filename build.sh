rm -rf out/target/product/RMX1941/*
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/crdroidandroid/android.git -b 13.0 --git-lfs --depth=1
#clone dev tree
git clone https://github.com/P-Salik/local_manifest --depth 1 -b lineage .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=nathturu
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_RMX1941
#export TARGET_RELEASE=RMX1941
export TZ=Asia/Jakarta
source build/envsetup.sh
 
# Build the ROM
lunch lineage_RMX1941-userdebug

#beelding

make bacon
