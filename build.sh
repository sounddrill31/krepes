rm -rf .repo/local_manifests/  && 
# Clone local_manifests repository
repo init -u https://github.com/ProjectBlaze/manifest.git -b 12.1 --git-lfs --depth=1
# clone dev tree
git clone https://github.com/nathannxx/local_manifests_RMX1941.git --depth 1 -b RMX1941 .repo/local_manifests &&

if [ ! 0 == 0 ]

 then   curl -o .repo/local_manifests https://github.com/nathannxx/local_manifests_RMX1941.git

   echo Git Clone Failed, downloading through curl instead...

 fi
 
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=nathturu
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
source build/envsetup.sh
 
# Build the ROM
lunch blaze_RMX1941-userdebug

# Build:D

make bacon
