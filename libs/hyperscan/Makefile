#
# Copyright (C) 2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hyperscan
PKG_VERSION:=5.3.0
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/intel/$(PKG_NAME)/archive/
PKG_HASH:=9b50e24e6fd1e357165063580c631a828157d361f2f27975c5031fc00594825b

PKG_MAINTAINER:=Gerrit Beine <gb@simonwunderlich.de>
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=ragel/host boost

CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/hyperscan
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=High-performance regular expression matching library
  URL:=https://www.hyperscan.io/
  DEPENDS:= \
	@TARGET_x86_64 \
	+boost \
	+boost-container \
	+boost-graph \
	+boost-random \
	+boost-regex \
	+boost-system
endef

CMAKE_OPTIONS += \
	-DBUILD_SHARED_LIBS=yes \
	-DCMAKE_BUILD_TYPE=MinSizeRel

define Package/hyperscan/description
	Hyperscan is a high-performance multiple regex matching library.
	It follows the regular expression syntax of the commonly-used
	libpcre library, but is a standalone library with its own C API.
endef

define Package/hyperscan/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,hyperscan))
