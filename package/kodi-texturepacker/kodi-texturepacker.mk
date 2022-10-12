################################################################################
#
# kodi-texturepacker
#
################################################################################

# Not possible to directly refer to kodi variables, because of
# first/second expansion trickery...
# batocera - backported v19.4 commit with libfmt 9.0 support.
KODI_TEXTUREPACKER_VERSION = 286694e9df8741313a688b46940661a30f36f35c
KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
KODI_TEXTUREPACKER_DL_SUBDIR = kodi
KODI_TEXTUREPACKER_LICENSE = GPL-2.0
KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.md
HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker
HOST_KODI_TEXTUREPACKER_DEPENDENCIES = \
	host-giflib \
	host-libjpeg \
	host-libpng \
	host-lzo

HOST_KODI_TEXTUREPACKER_CXXFLAGS = \
	$(HOST_CXXFLAGS) \
	-std=c++0x \
	-DTARGET_POSIX \
	-DTARGET_LINUX \
	-D_LINUX \
	-I$(@D)/xbmc/linux

HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
	-DCMAKE_CXX_FLAGS="$(HOST_KODI_TEXTUREPACKER_CXXFLAGS)" \
	-DCMAKE_MODULE_PATH=$(@D)/cmake/modules \
	-Wno-dev

define HOST_KODI_TEXTUREPACKER_INSTALL_CMDS
	$(INSTALL) -m 755 -D \
		$(@D)/tools/depends/native/TexturePacker/TexturePacker \
		$(HOST_DIR)/bin/TexturePacker
endef

$(eval $(host-cmake-package))
