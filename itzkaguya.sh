#!/bin/bash
echo "Init ENV" ;
# Change the Android Version, depending of Android Version of Kernel Source
export ANDROID_MAJOR_VERSION=q ;
export PLATFORM_VERSION=10 ;
# Change the kernel arch, depending of your Kernel Source arch
export ARCH=arm64 ;
export SUBARCH=arm64 ;
# Change the cross compile path to your own cross compile path
export CROSS_COMPILE=/workspace/ItzKaguya-Server/gcc/bin/aarch64-linux-gnu-
export CC=/workspace/ItzKaguya-Server/clang/bin/clang ;
echo "Clean Build ENV" ;
make clean && make mrproper;
echo "Init ENV" ;
# Change the build user
export KBUILD_BUILD_USER=ItzKaguya
export KBUILD_BUILD_HOST=ItzKaguya-PC
# Change the Android Version, depending of Android Version of Kernel Source
export ANDROID_MAJOR_VERSION=q ;
export PLATFORM_VERSION=10 ;
# Change the kernel arch, depending of your Kernel Source arch
export ARCH=arm64 ;
export SUBARCH=arm64 ;
echo "Building Kernel" ;
# Export the defconfig first
# example
# export DEFCONFIG=segawa_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y $(echo $DEFCONFIG) ;
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j$(nproc --all) ;
