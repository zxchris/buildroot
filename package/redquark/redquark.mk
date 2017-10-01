################################################################################
#
# the64
#
################################################################################

REDQUARK_SITE_METHOD = git
REDQUARK_GIT_SUBMODULES = YES
REDQUARK_SITE = ssh://git@bitbucket.org/ZXDesign/the64-firmware
#REDQUARK_VERSION = 0.1.2-pre
#REDQUARK_VERSION = timetest
#REDQUARK_VERSION = vbo_and_mali
#REDQUARK_VERSION = audio_video_sync
#REDQUARK_VERSION = sync_and_new_assets
#REDQUARK_VERSION = mali_carousel
REDQUARK_VERSION = keyboard_test
#REDQUARK_VERSION = vice-2_4_33-merge
#REDQUARK_LICENSE = the64 license
#REDQUARK_LICENSE_FILES = README
REDQUARK_INSTALL_STAGING = NO

$(eval $(autotools-package))
