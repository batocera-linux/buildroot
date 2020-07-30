################################################################################
#
# vkd3d
#
################################################################################

# Commit on 2020, Jul 23
VKD3D_VERSION = 29287d3368f70b57d05c4ae2e2c937ebbb539236
VKD3D_SITE = git://source.winehq.org/git/vkd3d
VKD3D_LICENSE = LGPL-2.1+
VKD3D_LICENSE_FILES = COPYING.LIB LICENSE
VKD3D_DEPENDENCIES = host-bison host-flex host-wine spirv-headers host-libtool #host-autoconf host-automake
VKD3D_CONF_ENV += WIDL="$(BUILD_DIR)/host-wine-$(WINE_VERSION)/tools/widl/widl"

VKD3D_CONF_OPTS =  --disable-shared --enable-static --disable-tests --with-sysroot=$(STAGING_DIR)
VKD3D_AUTORECONF = YES

VKD3D_INSTALL_STAGING = YES

#define VKD3D_INSTALL_TARGET_CMDS
#        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
#                STRIP=/bin/true \
#                DESTDIR=$(TARGET_DIR) \
#                install
#endef
#

#define VKD3D_INSTALL_STAGING_CMDS
#        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
#                PREFIX=$(TARGET_DIR)/usr \
#                STRIP=/bin/true \
#                DESTDIR=$(STAGING_DIR) \
#                install
#endef

$(eval $(autotools-package))
