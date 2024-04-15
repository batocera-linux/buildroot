################################################################################
#
# spirv-llvm-translator
#
################################################################################

# Generate version string using:
#   git describe --tags --match 'v18*' --abbrev=40 origin/llvm_release_180
# REG: 18.1.0 does not build
SPIRV_LLVM_TRANSLATOR_VERSION = v18.1.0
SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
SPIRV_LLVM_TRANSLATOR_INSTALL_STAGING = YES


SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm spirv-headers host-spirv-llvm-translator
SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
	-DLLVM_BUILD_TOOLS=ON \
	-DLLVM_DIR=$(STAGING_DIR)/lib/cmake/llvm \
	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
	-DLLVM_SPIRV_INCLUDE_TESTS=OFF \
	-DLLVM_EXTERNAL_PROJECTS="SPIRV-Headers" \
	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(STAGING_DIR)/include

$(eval $(cmake-package))

HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers
HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
	-DLLVM_BUILD_TOOLS=ON \
	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
	-DLLVM_SPIRV_INCLUDE_TESTS=OFF \
	-DLLVM_EXTERNAL_PROJECTS="SPIRV-Headers" \
	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(HOST_DIR)/include
$(eval $(host-cmake-package))
