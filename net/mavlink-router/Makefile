#
# Copyright (C) 2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mavlink-router
PKG_VERSION:=2
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/intel/mavlink-router.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2020-03-26
PKG_SOURCE_VERSION:=18891603c436dd360bb77589f4120507124856ad
PKG_MIRROR_HASH:=054e421565782df7f69c9e05a8889c61c1278b06cb7d1f81c80f08a2f7a9f1b3

PKG_MAINTAINER:=Gerrit Beine <gb@simonwunderlich.de>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

PKG_BUILD_DEPENDS=python3/host python-future/host

include $(INCLUDE_DIR)/package.mk

define Package/mavlink-router
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Route mavlink packets between endpoints
  URL:=https://github.com/intel/mavlink-router
  DEPENDS:=+libstdcpp
endef

define Package/mavlink-router/description
  mavlink-router
endef

CONFIGURE_ARGS+= \
	--disable-systemd

define Package/mavlink-router/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mavlink-router.init $(1)/etc/init.d/mavlink-router
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/mavlink-router.config $(1)/etc/config/mavlink-router
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mavlink-routerd $(1)/usr/bin
endef

$(eval $(call BuildPackage,mavlink-router))
