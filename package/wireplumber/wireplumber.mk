################################################################################
#
# wireplumber
#
################################################################################

WIREPLUMBER_VERSION = 0.4.14
WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
WIREPLUMBER_LICENSE = MIT
WIREPLUMBER_LICENSE_FILES = LICENSE
# batocera : remove lua
WIREPLUMBER_DEPENDENCIES = host-pkgconf pipewire libglib2

# batocera : disable lua system
WIREPLUMBER_CONF_OPTS = \
	-Ddoc=disabled \
	-Dsystem-lua=false \
	-Dsystem-lua-version=

ifeq ($(BR2_PACKAGE_DBUS),y)
WIREPLUMBER_DEPENDENCIES += dbus
endif

ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
WIREPLUMBER_DEPENDENCIES += host-doxygen host-python-lxml gobject-introspection
WIREPLUMBER_CONF_OPTS += -Dintrospection=enabled
else
WIREPLUMBER_CONF_OPTS += -Dintrospection=disabled
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
WIREPLUMBER_DEPENDENCIES += systemd
WIREPLUMBER_CONF_OPTS += \
	-Dsystemd=enabled \
	-Dsystemd-system-service=true \
	-Dsystemd-user-service=true
else
WIREPLUMBER_CONF_OPTS += \
	-Dsystemd=disabled \
	-Dsystemd-system-service=false \
	-Dsystemd-user-service=false
endif

# batocera
# this is a not nice workaround
# i don't know why meson uses bad ssl certificates and doesn't manage to download them
define WIREPLUMBER_DWD_DEPENDENCIES
	mkdir -p $(@D)/subprojects/packagecache
	$(HOST_DIR)/bin/curl -L https://www.lua.org/ftp/lua-5.4.4.tar.gz               -o $(@D)/subprojects/packagecache/lua-5.4.4.tar.gz
	$(HOST_DIR)/bin/curl -L https://wrapdb.mesonbuild.com/v2/lua_5.4.4-1/get_patch -o $(@D)/subprojects/packagecache/lua_5.4.4-1_patch.zip
endef
WIREPLUMBER_DEPENDENCIES += host-libcurl
WIREPLUMBER_PRE_CONFIGURE_HOOKS += WIREPLUMBER_DWD_DEPENDENCIES


$(eval $(meson-package))
