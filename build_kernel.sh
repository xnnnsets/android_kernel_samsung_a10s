#!/bin/bash
echo "Init ENV" ;
# Change the Android Version, depending of Android Version of Kernel Source
export ANDROID_MAJOR_VERSION=q ;
export PLATFORM_VERSION=10 ;
# Change the kernel arch, depending of your Kernel Source arch
export ARCH=arm64 ;
export SUBARCH=arm64 ;
# Change the cross compile path to your own cross compile path
export CROSS_COMPILE=$(pwd)/toolchain/gcc/linux-x86/aarch64/aarch64-buildroot-linux-android-4.9/bin/aarch64-buildroot-linux-gnu-
export CC=$(pwd)/toolchain/clang/host/linux-x86/clang-r487747c/bin/clang ;
# Change the Android Version, depending of Android Version of Kernel Source
export ANDROID_MAJOR_VERSION=q ;
export PLATFORM_VERSION=10 ;
# Change the kernel arch, depending of your Kernel Source arch
export ARCH=arm64 ;
export SUBARCH=arm64 ;
echo "Building Kernel" ;
# Export the defconfig first
# example
export DEFCONFIG=itzkaguya-perf_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y $(echo $DEFCONFIG) ;
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j$(nproc --all) ;
