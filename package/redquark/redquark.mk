################################################################################
#
# the64
#
################################################################################

REDQUARK_SITE_METHOD = git
REDQUARK_GIT_SUBMODULES = YES
REDQUARK_SITE = ssh://git@bitbucket.org/ZXDesign/the64-firmware
#REDQUARK_VERSION = 0.1.2-pre
REDQUARK_VERSION = a361c7a9cf9523ca88d39f6ed2de0683dd1ecaa5
REDQUARK_LICENSE = the64 license
REDQUARK_LICENSE_FILES = README
REDQUARK_INSTALL_STAGING = NO

$(eval $(autotools-package))
