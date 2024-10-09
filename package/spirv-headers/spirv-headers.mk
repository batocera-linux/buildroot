################################################################################
#
# spirv-headers
#
################################################################################
# batocera - update 1.3.297 has not been tagged yet, use the hash
# Keep in sync with spirv-tools version
SPIRV_HEADERS_VERSION = a62b032007b2e7a69f24a195cbfbd0cf22d31bb0
#SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
