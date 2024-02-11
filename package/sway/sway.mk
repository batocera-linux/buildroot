################################################################################
#
# sway
#
################################################################################
# batocera (update)
SWAY_VERSION = 1.9-rc3
SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
SWAY_LICENSE = MIT
SWAY_LICENSE_FILES = LICENSE
SWAY_DEPENDENCIES = host-pkgconf wlroots json-c pcre2 cairo pango
SWAY_CONF_OPTS = \
	-Dwerror=false \
	-Ddefault-wallpaper=false \
	-Dzsh-completions=false \
	-Dbash-completions=true \
	-Dfish-completions=false \
	-Dswaybar=false \
	-Dswaynag=false \
	-Dtray=disabled \
	-Dman-pages=disabled
# batocera - We don't want systemd
#-Dsd-bus-provider=libsystemd

ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
SWAY_CONF_OPTS += -Dxwayland=enabled
else
SWAY_CONF_OPTS += -Dxwayland=disabled
endif

ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
SWAY_CONF_OPTS += -Dgdk-pixbuf=enabled
SWAY_DEPENDENCIES += gdk-pixbuf
else
SWAY_CONF_OPTS += -Dgdk-pixbuf=disabled
endif

# batocera - Install only what is needed avoiding systemd files
define SWAY_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/bin
    $(INSTALL) -D $(@D)/build/sway/sway         $(TARGET_DIR)/usr/bin
    $(INSTALL) -D $(@D)/build/swaymsg/swaymsg   $(TARGET_DIR)/usr/bin
endef

$(eval $(meson-package))
