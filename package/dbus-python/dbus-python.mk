################################################################################
#
# dbus-python
#
################################################################################

DBUS_PYTHON_VERSION = 1.2.18
DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
DBUS_PYTHON_INSTALL_STAGING = YES
DBUS_PYTHON_LICENSE = MIT (dbus-python), AFL-2.1 or GPL-2.0+ (dbus-gmain)
DBUS_PYTHON_LICENSE_FILES = COPYING dbus-gmain/COPYING
DBUS_PYTHON_DEPENDENCIES = dbus libglib2 python3 host-python3
HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-libglib2 host-python3

DBUS_PYTHON_CONF_ENV = \
	PYTHON=$(HOST_DIR)/bin/python3 \
	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"

HOST_DBUS_PYTHON_CONF_ENV = \
	PYTHON=$(HOST_DIR)/bin/python3 \
	PYTHON_INCLUDES="`$(HOST_DIR)/bin/python3-config --includes`" \
	PYTHON_LIBS="`$(HOST_DIR)/bin/python3-config --ldflags`" \
	PYTHON_EXTRA_LIBS="`$(HOST_DIR)/bin/python3-config --libs --embed`"

# batocera ; #500
define DBUS_PYTHON_INSTALL_TARGET_CMDS
	touch $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/dbus_python-$(DBUS_PYTHON_VERSION).egg-info
endef

$(eval $(autotools-package))
$(eval $(host-autotools-package))
