#
# Copyright (C) 2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rustc
PKG_VERSION:=1.46.0

PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=https://static.rust-lang.org/dist/
PKG_HASH:=2d6a3b7196db474ba3f37b8f5d50a1ecedff00738d7846840605b42bfc922728

PKG_MAINTAINER:=Gerrit Beine <gb@simonwunderlich.de>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE-APACHE

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-$(PKG_VERSION)-src
HOST_BUILD_DEPENDS:=python3/host curl-host/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/rustc
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=The Rust Programming Language
  URL:=https://www.rust-lang.org/
endef

define Package/rustc/description
	Rust - A language empowering everyone to build reliable and efficient
	software.
endef

HOST_CONFIGURE_ARGS:=$(filter-out \
	--target=% \
	--host=% \
	--build=% \
	--program-prefix=% \
	--program-suffix=% \
	--exec-prefix=% \
	--sbindir=% \
	--libexecdir=% \
	--disable-nls \
	, $(HOST_CONFIGURE_ARGS))

define Host/Compile
	+$(MAKE) $(PKG_JOBS) -C $(HOST_BUILD_DIR)
endef

define Host/Install
	+$(MAKE) $(PKG_JOBS) -C $(HOST_BUILD_DIR) \
		install
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,rustc))
