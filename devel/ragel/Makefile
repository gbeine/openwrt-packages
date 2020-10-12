#
# Copyright (C) 2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ragel
PKG_VERSION:=6.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.colm.net/files/$(PKG_NAME)/
PKG_HASH:=5f156edb65d20b856d638dd9ee2dfb43285914d9aa2b6ec779dac0270cd56c3f

PKG_MAINTAINER:=Gerrit Beine <gb@simonwunderlich.de>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/ragel
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Ragel State Machine Compiler
  URL:=http://www.colm.net/open-source/ragel/
  DEPENDS:=+libstdcpp
endef

define Package/ragel/description
	Ragel compiles executable finite state machines from regular
	languages. Ragel targets C, C++ and ASM. Ragel state machines
	can not only recognize byte sequences as regular expression machines
	do, but can also execute code at arbitrary points in the recognition
	of a regular language. Code embedding is done using inline operators
	that do not disrupt the regular language syntax.
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,ragel))
