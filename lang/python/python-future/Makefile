include $(TOPDIR)/rules.mk

PKG_NAME:=future
PKG_VERSION:=0.18.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/source/f/$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-future-$(PKG_VERSION)
PKG_HASH:=b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d

PKG_MAINTAINER:=Gerrit Beine <gb@simonwunderlich.de>
PKG_LICENSE:=MIT

HOST_BUILD_DEPENDS:=python3/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include ../../../../packages/lang/python/python-package.mk
include ../../../../packages/lang/python/python3-package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)
HOST_UNPACK:=$(HOST_TAR) -C $(HOST_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python-future/Default
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=future
  URL:=https://python-future.org/
endef

define Package/python-future
$(call Package/python-future/Default)
  DEPENDS:= \
      +PACKAGE_python-future:python-light
  VARIANT:=python
endef

define Package/python3-future
$(call Package/python-future/Default)
  DEPENDS:= \
      +PACKAGE_python3-future:python3-light
  VARIANT:=python3
endef

define Package/python-future/description
  future is the missing compatibility layer between Python 2 and Python 3.
  It allows you to use a single, clean Python 3.x-compatible codebase to
  support both Python 2 and Python 3 with minimal overhead.
endef

define Package/python3-future/description
$(call Package/python-future/description)
.
(Variant for Python3)
endef

define Host/Compile
	$(call Build/Compile/HostPy3Mod,,install --prefix="" --root="$(STAGING_DIR_HOSTPKG)")
endef

Host/Install:=

$(eval $(call HostBuild))

$(eval $(call PyPackage,python-future))
$(eval $(call BuildPackage,python-future))

$(eval $(call Py3Package,python3-future))
$(eval $(call BuildPackage,python3-future))
