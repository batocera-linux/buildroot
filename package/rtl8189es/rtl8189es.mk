################################################################################
#
# rtl8189es
#
################################################################################
# batocera (update)
RTL8189ES_VERSION = 1269e117454069cd47f1822ffa31e29ec19a10da
RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
RTL8189ES_LICENSE = GPL-2.0

# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
RTL8189ES_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
# Set endianness
RTL8189ES_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN

RTL8189ES_MODULE_MAKE_OPTS = \
	CONFIG_RTL8189ES=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR) \
	USER_EXTRA_CFLAGS="-Wno-error"

define RTL8189ES_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
