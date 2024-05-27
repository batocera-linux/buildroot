################################################################################
#
# python-future
#
################################################################################
# batocera - bump
PYTHON_FUTURE_VERSION = v1.0.0
PYTHON_FUTURE_SOURCE = $(PYTHON_FUTURE_VERSION).tar.gz
PYTHON_FUTURE_SITE = https://github.com/PythonCharmers/python-future/archive/refs/tags
PYTHON_FUTURE_SETUP_TYPE = setuptools
PYTHON_FUTURE_LICENSE = MIT
PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
