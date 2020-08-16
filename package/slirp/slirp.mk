################################################################################
#
# slirp
#
################################################################################

# batocera
SLIRP_VERSION = v4.3.1
SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/$(SLIRP_VERSION)
SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.gz
# There's no tarball releases of slirp, so we use the git repo
# Also, there's no tag, so we use a random SHA1 (master's HEAD
# of today)
#SLIRP_VERSION = 8c2da74c1385242f20799fec8c04f8378edc6550
#SLIRP_SITE = git://anongit.freedesktop.org/spice/slirp

SLIRP_LICENSE = BSD-4-Clause, BSD-2-Clause
# Note: The license file 'COPYRIGHT' is missing from the sources,
# although some files refer to it.
SLIRP_INSTALL_STAGING = YES

# As we're using the git tree, there's no ./configure,
# so we need to autoreconf.
#batocera
#SLIRP_AUTORECONF = YES

#batocera
#$(eval $(autotools-package))
$(eval $(meson-package))
