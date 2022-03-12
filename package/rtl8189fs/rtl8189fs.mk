################################################################################
#
# rtl8189fs
#
################################################################################

# batocera (update)
RTL8189FS_VERSION = be378f47055da1bae42ff6ec1d62f1a5052ef097
RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
RTL8189FS_LICENSE = GPL-2.0

RTL8189FS_MODULE_MAKE_OPTS = \
	CONFIG_RTL8189FS=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
