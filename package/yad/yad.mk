################################################################################
#
# yad
#
################################################################################
# batocera - bump & remove gtk3 dependency
YAD_VERSION = 15.0
YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
YAD_SITE = https://github.com/v1cont/yad/releases/download/v$(YAD_VERSION)
YAD_LICENSE = GPL-3.0
YAD_LICENSE_FILES = COPYING
YAD_DEPENDENCIES = host-intltool host-pkgconf $(TARGET_NLS_DEPENDENCIES)
YAD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
YAD_CONF_OPTS = --enable-html=no

$(eval $(autotools-package))
