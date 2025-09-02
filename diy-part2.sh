#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.1.88/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# OpenWrt 24.10 可能 会404，需要本地编译LLVM
# 热补丁 OpenWrt 的 rust 配方，避免从 CI 拉 LLVM（会改为本地构建 LLVM）
#RUST_MK="feeds/packages/lang/rust/Makefile"
#if grep -q 'llvm.download-ci-llvm=true' "$RUST_MK"; then
#  sed -i 's/llvm.download-ci-llvm=true/llvm.download-ci-llvm=false/' "$RUST_MK"
#fi