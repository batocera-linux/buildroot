################################################################################
#
# libserialport
#
################################################################################

# batocera - update to support vpinball

LIBSERIALPORT_VERSION = fd20b0fc5a34cd7f776e4af6c763f59041de223b
LIBSERIALPORT_SITE = $(call github,sigrokproject,libserialport,$(LIBSERIALPORT_VERSION))
LIBSERIALPORT_LICENSE = LGPL-3.0+
LIBSERIALPORT_LICENSE_FILES = COPYING
LIBSERIALPORT_INSTALL_STAGING = YES
LIBSERIALPORT_DEPENDENCIES = host-pkgconf
LIBSERIALPORT_AUTORECONF = YES

$(eval $(autotools-package))
