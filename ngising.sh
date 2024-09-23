rm -rf .repo/local_manifests/  && 
# Clone local_manifests repository
repo init -u https://github.com/RisingTechOSS/android -b thirteen --git-lfs 
git clone https://github.com/nathannxx/local_manifests_ngising --depth 1 -b ngising .repo/local_manifests && 

# Sync the repositories
/opt/crave/resync.sh  && 

# Set up build environment
export BUILD_USERNAME=nathannxx 
 export BUILD_HOSTNAME=YouDeer
 source build/envsetup.sh && 

# Build the ROM
lunch lineage_RMX1941-userdebug && make installclean && brunch RMX1941
