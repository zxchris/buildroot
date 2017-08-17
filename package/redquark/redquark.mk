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
#REDQUARK_VERSION = 65e295572305a0c80a8901d8f42b84176a730b29
REDQUARK_VERSION = 7a08017683568cdbbc75a7003705c2fc47e0a7dd
REDQUARK_LICENSE = the64 license
REDQUARK_LICENSE_FILES = README
REDQUARK_INSTALL_STAGING = NO

$(eval $(autotools-package))
