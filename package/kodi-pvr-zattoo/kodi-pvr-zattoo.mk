################################################################################
#
# kodi-pvr-zattoo
#
################################################################################
# batocera - bump
KODI_PVR_ZATTOO_VERSION = 21.0.3-Omega
KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
KODI_PVR_ZATTOO_DEPENDENCIES = kodi rapidjson tinyxml2

$(eval $(cmake-package))
