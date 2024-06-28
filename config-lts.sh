#
# Apply dxgkrnl patch
#
git apply ../patches/0001-6.1.y-dxgkrnl.patch
git apply ../patches/0002-dxgkrnl-enable-mainline-support.patch
git apply ../patches/0003-bbrv3-fix-clang-build.patch
git apply ../patches/0004-nf_nat_fullcone-fix-clang-uninitialized-var-werror.patch

if [ $? != 0 ]; then
    echo "Patch conflict!"
    exit 1 # so it can be catched by github action
fi
#
# generate .config
#
cp ../wsl2_defconfig ./arch/x86/configs/wsl2_defconfig
make LLVM=1 LLVM_IAS=1 wsl2_defconfig
make LLVM=1 LLVM_IAS=1 oldconfig
