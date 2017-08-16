################################################################################
#
# the64
#
################################################################################

REDQUARK_SITE_METHOD = git
REDQUARK_GIT_SUBMODULES = YES
REDQUARK_SITE = ssh://git@bitbucket.org/ZXDesign/the64-firmware
#REDQUARK_VERSION = 0.1.2-pre
REDQUARK_VERSION = c72c347b9b5e08dce22e5f6c50c1c1ff07698492
REDQUARK_LICENSE = the64 license
REDQUARK_LICENSE_FILES = README
REDQUARK_INSTALL_STAGING = NO

$(eval $(autotools-package))
