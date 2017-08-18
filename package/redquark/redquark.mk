################################################################################
#
# the64
#
################################################################################

REDQUARK_SITE_METHOD = git
REDQUARK_GIT_SUBMODULES = YES
REDQUARK_SITE = ssh://git@bitbucket.org/ZXDesign/the64-firmware
#REDQUARK_VERSION = 0.1.2-pre
# This version is the full non-mai test.
#REDQUARK_VERSION = 65e295572305a0c80a8901d8f42b84176a730b2
REDQUARK_VERSION = f240d676eafb4dc8abea335c841c2b09a1a2aea
#REDQUARK_LICENSE = the64 license
#REDQUARK_LICENSE_FILES = README
REDQUARK_INSTALL_STAGING = NO

$(eval $(autotools-package))
