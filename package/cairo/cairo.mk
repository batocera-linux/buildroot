################################################################################
#
# cairo
#
################################################################################
# batocera - bump & move to meson
# Config.in & most of this file has changed including removal of redundanet patches
CAIRO_VERSION = 1.18.0
CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
CAIRO_CPE_ID_VENDOR = cairographics
CAIRO_SITE = http://cairographics.org/releases
CAIRO_INSTALL_STAGING = YES

CAIRO_CONF_OPTS = \
	-Dtests=disabled \
	-Dgtk_doc=false

CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman

# Just the bare minimum to make other host-* packages happy
HOST_CAIRO_CONF_OPTS = \
	-Dtests=disabled \
	-Dgtk_doc=false
HOST_CAIRO_DEPENDENCIES = \
	host-freetype \
	host-fontconfig \
	host-libglib2 \
	host-libpng \
	host-pixman \
	host-pkgconf

ifeq ($(BR2_PACKAGE_FREETYPE),y)
CAIRO_CONF_OPTS += -Dfreetype=enabled
CAIRO_DEPENDENCIES += freetype
else
CAIRO_CONF_OPTS += -Dfreetype=disabled
endif

ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
CAIRO_DEPENDENCIES += libexecinfo
endif

ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
CAIRO_DEPENDENCIES += libglib2
endif

# Can use GL or GLESv2 but not both
ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
CAIRO_DEPENDENCIES += libgl
else
ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
CAIRO_DEPENDENCIES += libgles
endif
endif

ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
CAIRO_DEPENDENCIES += libopenvg
endif

ifeq ($(BR2_PACKAGE_LZO),y)
CAIRO_DEPENDENCIES += lzo
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
CAIRO_CONF_OPTS += -Dxlib=enabled -Dxcb=enabled -Dxlib-xcb=enabled
CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext libxcb
else
CAIRO_CONF_OPTS += -Dxlib=disabled -Dxcb=disabled -Dxlib-xcb=disabled
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
CAIRO_DEPENDENCIES += xlib_libXrender
endif

ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
CAIRO_CONF_OPTS += -Dzlib=enabled
CAIRO_DEPENDENCIES += zlib
else
CAIRO_CONF_OPTS += -Dzlib=disabled
endif

ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
CAIRO_CONF_OPTS += -Dpng=enabled
CAIRO_DEPENDENCIES += libpng
else
CAIRO_CONF_OPTS += -Dpng=disabled
endif

ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
CAIRO_CONF_OPTS += -Dtee=enabled
else
CAIRO_CONF_OPTS += -Dtee=disabled
endif

$(eval $(meson-package))
$(eval $(host-meson-package))
