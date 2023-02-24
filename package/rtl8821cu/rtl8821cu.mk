################################################################################
#
# rtl8821cu
#
################################################################################

RTL8821CU_VERSION = 86cc5ceb7c28b9b997838e1c796847f6c395c382
RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
RTL8821CU_LICENSE = GPL-2.0
RTL8821CU_LICENSE_FILES = LICENSE

RTL8821CU_USER_EXTRA_CFLAGS = \
	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
	-DCONFIG_IOCTL_CFG80211 \
	-DRTW_USE_CFG80211_STA_EVENT \
	-Wno-error

RTL8821CU_MODULE_MAKE_OPTS = \
	CONFIG_PLATFORM_GENERIC=n \
	CONFIG_RTL8821CU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
