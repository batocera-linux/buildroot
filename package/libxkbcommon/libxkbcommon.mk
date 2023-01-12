################################################################################
#
# libxkbcommon
#
################################################################################
# batocera (update)
LIBXKBCOMMON_VERSION = 1.5.0
LIBXKBCOMMON_SITE = https://xkbcommon.org/download
LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
LIBXKBCOMMON_LICENSE = MIT/X11
LIBXKBCOMMON_LICENSE_FILES = LICENSE
LIBXKBCOMMON_CPE_ID_VENDOR = xkbcommon
LIBXKBCOMMON_INSTALL_STAGING = YES
LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
LIBXKBCOMMON_CONF_OPTS = \
	-Denable-docs=false \
	-Denable-xkbregistry=false

# batocera
ifeq ($(BR2_PACKAGE_WAYLAND),y)
LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=true
else
LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=false
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
LIBXKBCOMMON_DEPENDENCIES += libxcb
else
LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
endif

ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS),y)
LIBXKBCOMMON_CONF_OPTS += -Denable-tools=true
else
LIBXKBCOMMON_CONF_OPTS += -Denable-tools=false
endif

$(eval $(meson-package))
