################################################################################
#
# python-evdev
#
################################################################################

PYTHON_EVDEV_VERSION = 1.9.3
PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/a5/f5/397b61091120a9ca5001041dd7bf76c385b3bfd67a0e5bcb74b852bd22a4
PYTHON_EVDEV_SETUP_TYPE = setuptools
PYTHON_EVDEV_LICENSE = Revised BSD License
PYTHON_EVDEV_LICENSE_FILES = LICENSE

# batocera - Build python-evdev for the host so we get a generated ecodes.py with
# static dicts instead of using ecodes_runtime.py (which builds the dicts on the fly
# when it is first imported)
PYTHON_EVDEV_DEPENDENCIES = host-python-evdev

PYTHON_EVDEV_BUILD_OPTS = \
	-C--build-option=build_ecodes \
	-C--build-option=--evdev-headers=$(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h

# batocera - Build with the headers in staging so the generated ecodes.py is for the target
HOST_PYTHON_EVDEV_DEPENDENCIES = linux-headers

HOST_PYTHON_EVDEV_BUILD_OPTS = \
	-C--build-option=build_ecodes \
	-C--build-option=--evdev-headers=$(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h

# batocera - For cross-compilation, we need to install the ecodes.py that was generated on
# the host because the target generation will fail due to the evdev build process trying to
# import the target ecodes.so. Since both the host and the target build with the same headers,
# the source of the module will be the same and the host build process will generate
# a static ecodes.py (rather than copy the dynamic ecodes_runtime.py).
define PYTHON_EVDEV_INSTALL_ECODES_MODULE
	$(INSTALL) -m 0644 $(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/evdev/ecodes.py \
		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/evdev
endef
PYTHON_EVDEV_POST_INSTALL_TARGET_HOOKS += PYTHON_EVDEV_INSTALL_ECODES_MODULE

$(eval $(python-package))
# batocera - add a host package for python-evdev so we can generate the ecodes.py module on the host
$(eval $(host-python-package))
