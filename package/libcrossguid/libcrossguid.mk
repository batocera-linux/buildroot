################################################################################
#
# libcrossguid
#
################################################################################

# batocera / version bump for kodi20
# LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
LIBCROSSGUID_VERSION = ca1bf4b810e2d188d04cb6286f957008ee1b7681
LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
LIBCROSSGUID_LICENSE = MIT
LIBCROSSGUID_LICENSE_FILES = LICENSE
LIBCROSSGUID_INSTALL_STAGING = YES
# batocera
# # only a static library
# -LIBCROSSGUID_INSTALL_TARGET = NO

LIBCROSSGUID_DEPENDENCIES = util-linux

# batocera
# define LIBCROSSGUID_BUILD_CMDS
#       (cd $(@D); $(TARGET_CXX) $(TARGET_CXXFLAGS) -std=c++11 -DGUID_LIBUUID \
#               -c guid.cpp -o guid.o)
#       (cd $(@D); $(TARGET_AR) rvs libcrossguid.a guid.o)
#endef
#
#define LIBCROSSGUID_INSTALL_STAGING_CMDS
#       $(INSTALL) -D -m 644 $(@D)/libcrossguid.a \
#               $(STAGING_DIR)/usr/lib/libcrossguid.a
#       $(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
#endef
#
#$(eval $(generic-package))

$(eval $(cmake-package))
