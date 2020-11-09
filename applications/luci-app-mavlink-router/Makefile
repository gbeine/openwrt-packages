include $(TOPDIR)/rules.mk

LUCI_TITLE:=MAVLink Router LuCI interface
LUCI_DEPENDS:=+luci-compat +luci-mod-admin-full mavlink-router
LUCI_PKGARCH:=all
LUCI_DESCRIPTION:=Provides a webadmin for most basic MAVLink Router parameters.

PKG_MAINTAINER:=Gerrit Beine <gb@simonwunderlich.de>
PKG_LICENSE:=Apache-2.0

include ../../../luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
