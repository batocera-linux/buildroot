################################################################################
#
# yad
#
################################################################################

YAD_VERSION = v0.42.0
YAD_SITE = $(call github,v1cont,yad,$(YAD_VERSION))
YAD_LICENSE = GPL-3.0
YAD_LICENSE_FILES = COPYING
YAD_DEPENDENCIES = host-intltool host-pkgconf $(TARGET_NLS_DEPENDENCIES)
YAD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
YAD_CONF_OPTS = --enable-html=no

# batocera add autoreconf & opts
YAD_AUTORECONF = YES

ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
YAD_DEPENDENCIES += libgtk3
YAD_CONF_OPTS += --with-gtk=gtk3
else
YAD_DEPENDENCIES += libgtk2
YAD_CONF_OPTS += --with-gtk=gtk2
endif

$(eval $(autotools-package))
