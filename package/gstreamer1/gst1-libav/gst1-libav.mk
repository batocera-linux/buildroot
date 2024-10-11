################################################################################
#
# gst1-libav
#
################################################################################
# batocera - bump
GST1_LIBAV_VERSION = 1.24.8
GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
GST1_LIBAV_LICENSE = LGPL-2.1+
GST1_LIBAV_LICENSE_FILES = COPYING
GST1_LIBAV_DEPENDENCIES =  host-pkgconf ffmpeg gstreamer1 gst1-plugins-base
GST1_LIBAV_CONF_OPTS = -Ddoc=disabled

# batocera - workaround, use ffmpeg-rockchip for RK devices
ifeq ($(BR2_PACKAGE_ROCKCHIP_RGA),y)
GST1_LIBAV_DEPENDENCIES += ffmpeg-rockchip
endif

$(eval $(meson-package))
