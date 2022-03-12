################################################################################
#
# rtl8821au
#
################################################################################

#batocera (change repo and hash)
RTL8821AU_VERSION = e2df993bfd5b88e61770b461d94d0700cec2dbe5
RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
RTL8821AU_LICENSE = GPL-2.0
RTL8821AU_LICENSE_FILES = LICENSE

RTL8821AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8812AU_8821AU=m \
# batocera: setting KVER breaks top level parallelization
	# KVER=$(LINUX_VERSION_PROBED)
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
