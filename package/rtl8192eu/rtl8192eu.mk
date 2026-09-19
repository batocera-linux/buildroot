################################################################################
#
# rtl8192eu
#
################################################################################

ifeq ($(BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4),y)
# batocera
RTL8192EU_VERSION = a928f08c1dd4f9a1e84d85811a543e974551bc4f
else
# batocera - kernel 7.2+ support
RTL8192EU_VERSION = 0c01d67c609de752ac0b80a7e7152a3fa42b7234
endif

RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
RTL8192EU_LICENSE = GPL-2.0

RTL8192EU_USER_EXTRA_CFLAGS = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
			      -DCONFIG_IOCTL_CFG80211 \
			      -DRTW_USE_CFG80211_STA_EVENT \
			      -Wno-error

# batocera - change to `USER_ccflags-y` for 6.15
RTL8192EU_MODULE_MAKE_OPTS = \
	CONFIG_PLATFORM_I386_PC=n \
	CONFIG_RTL8192EU=m \
	USER_EXTRA_CFLAGS="$(RTL8192EU_USER_EXTRA_CFLAGS)" \
	USER_ccflags-y="$(RTL8192EU_USER_EXTRA_CFLAGS)"

define RTL8192EU_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
