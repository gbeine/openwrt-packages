#
# Copyright (C) 2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=suricata
PKG_VERSION:=4.1.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.openinfosecfoundation.org/download/
PKG_HASH:=3440cd1065b1b3999dc101a37c49321fab2791b38f16e2f7fe27369dd007eea7

PKG_MAINTAINER:=Gerrit Beine <gb@simonwunderlich.de>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include ../../../packages/lang/python/python-package.mk

define Package/suricata/config
	source "$(SOURCE)/Config.in"
endef

CONFIGURE_ARGS+= \
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--enable-gccprotect \
	--enable-pie \
	--enable-non-bundled-htp \
	--disable-suricata-update \
	--disable-rust \
	--host=$(ARCH)

ifdef CONFIG_SURICATA_NETFILTER_LOG
CONFIGURE_ARGS+=--enable-nflog
else
CONFIGURE_ARGS+=--disable-nflog
endif
ifdef CONFIG_SURICATA_NETFILTER_QUEUE
CONFIGURE_ARGS+=--enable-nfqueue
else
CONFIGURE_ARGS+=--disable-nfqueue
endif
ifdef CONFIG_SURICATA_LIBNET
CONFIGURE_ARGS+=--with-libnet-includes=$(STAGING_DIR)/usr/include
endif
ifdef CONFIG_SURICATA_HYPERSCAN
CONFIGURE_ARGS+=--with-libhs-includes=$(STAGING_DIR)/usr/include/hs
endif

define Package/suricata/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Network IDS, IPS and NSM engine
  URL:=https://suricata-ids.org/
endef

define Package/suricata
  $(call Package/suricata/Default)
  DEPENDS:=+libpcap +libpcre +libmagic +file +zlib +libyaml +jansson +libhtp \
	+liblzma \
	+SURICATA_NETFILTER:libnfnetlink \
	+SURICATA_NETFILTER_LOG:libnetfilter-log \
	+SURICATA_NETFILTER_QUEUE:libnetfilter-queue \
	+SURICATA_LIBNET:libnet-1.2.x \
	+SURICATA_HYPERSCAN:hyperscan \
	+SURICATA_TCMALLOC:tcmalloc-minimal
endef

define Package/suricata-scripts
  $(call Package/suricata/Default)
  TITLE:=Suricata-IDS Python scripts
  DEPENDS:=@PACKAGE_suricata +python +python-simplejson
endef

define Package/suricata-update
  $(call Package/suricata/Default)
  TITLE:=Suricata-IDS rules update tool
  DEPENDS:=@PACKAGE_suricata-scripts +python +python-yaml
endef

define Package/suricata/Default/description
  Suricata is a free and open source, mature, fast and robust network
  threat detection engine.
endef

define Package/suricata/description
  $(call Package/suricata/Default/description)
endef

define Package/suricata-scripts/description
  $(call Package/suricata/Default/description)
  This package contains python scripts for suricata.
endef

define Package/suricata-update/description
  $(call Package/suricata/Default/description)
  This package contains the tool for keeping rules up to date.
endef

define Build/Compile
	$(call Build/Compile/PyMod,suricata-update,\
		install --prefix=/usr --root="$(PKG_INSTALL_DIR)" \
	)
	$(call Build/Compile/Default)
endef

define Package/suricata/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/suricata.init $(1)/etc/init.d/suricata
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/suricata.config $(1)/etc/config/suricata
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/suricata $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/suricata/rules
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/suricata.yaml \
		$(PKG_BUILD_DIR)/classification.config \
		$(PKG_BUILD_DIR)/reference.config \
		$(PKG_BUILD_DIR)/threshold.config \
		$(1)/etc/suricata
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/rules/*.rules $(1)/etc/suricata/rules
endef

define Package/suricata-scripts/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/suricatactl $(1)/usr/bin
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/suricata
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/suricata/{config,ctl} \
		$(1)$(PYTHON_PKG_DIR)/suricata
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/suricata/__init__.py \
		$(1)$(PYTHON_PKG_DIR)/suricata
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/suricata-$(PKG_VERSION)*egg-info \
		$(1)$(PYTHON_PKG_DIR)
endef

define Package/suricata-update/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/suricata-update $(1)/usr/bin
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/suricata/update
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/suricata/update/* \
		$(1)$(PYTHON_PKG_DIR)/suricata/update
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/suricata_update*egg-info \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,suricata))
$(eval $(call BuildPackage,suricata-scripts))
$(eval $(call BuildPackage,suricata-update))
