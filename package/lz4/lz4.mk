################################################################################
#
# lz4
#
################################################################################

LZ4_VERSION = 1.10.0
LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
LZ4_INSTALL_STAGING = YES
LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
LZ4_CPE_ID_VALID = YES

# batocera: use CMake build system instead of Makefile for host build
# so that CMake based packages can find lz4 library and headers in host build
LZ4_SUPPORTS_IN_SOURCE_BUILD = NO
HOST_LZ4_SUBDIR = build/cmake

ifeq ($(BR2_STATIC_LIBS),y)
LZ4_MAKE_OPTS += BUILD_SHARED=no
else ifeq ($(BR2_SHARED_LIBS),y)
LZ4_MAKE_OPTS += BUILD_STATIC=no
endif

LZ4_DIRS = lib

ifeq ($(BR2_PACKAGE_LZ4_PROGS),y)
LZ4_DIRS += programs
endif

# batcoera fix prefix directory - add PREFIX=/usr
define LZ4_BUILD_CMDS
	$(foreach dir,$(LZ4_DIRS),\
		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) PREFIX=/usr $(LZ4_MAKE_OPTS) \
			-C $(@D)/$(dir)
	)
endef

define LZ4_INSTALL_STAGING_CMDS
	$(foreach dir,$(LZ4_DIRS),\
		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
			PREFIX=/usr $(LZ4_MAKE_OPTS) -C $(@D)/$(dir) install
	)
endef

define LZ4_INSTALL_TARGET_CMDS
	$(foreach dir,$(LZ4_DIRS),\
		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
			PREFIX=/usr $(LZ4_MAKE_OPTS) -C $(@D)/$(dir) install
	)
endef

$(eval $(generic-package))
$(eval $(host-cmake-package))
