################################################################################
#
# libogg
#
################################################################################

LIBOGG_VERSION = 1.3.5
LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
LIBOGG_LICENSE = BSD-3-Clause
LIBOGG_LICENSE_FILES = COPYING

LIBOGG_INSTALL_STAGING = YES
LIBOGG_DEPENDENCIES = host-pkgconf

# batocera - use cmake
$(eval $(cmake-package))
