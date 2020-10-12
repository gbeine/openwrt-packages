#
# Copyright (C) 2007-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=curl-host
PKG_VERSION:=7.66.0
PKG_RELEASE:=1

PKG_SOURCE:=curl-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://dl.uxnr.de/mirror/curl/ \
	https://curl.mirror.anstey.ca/ \
	https://curl.askapache.com/download/ \
	https://curl.haxx.se/download/
PKG_HASH:=dbb48088193016d079b97c5c3efde8efa56ada2ebf336e8a97d04eb8e2ed98c1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf

HOST_BUILD_PARALLEL:=1
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/curl-$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/curl-host
  SECTION:=net
  CATEGORY:=Network
  TITLE:=curl for host build
  URL:=http://curl.haxx.se/
  MAINTAINER:=Gerrit Beine <gb@simonwunderlich.de>
endef

define Host/Compile
	+$(MAKE) $(PKG_JOBS) -C $(HOST_BUILD_DIR)
endef

define Host/Install
	+$(MAKE) $(PKG_JOBS) -C $(HOST_BUILD_DIR) \
		install
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,curl-host))
