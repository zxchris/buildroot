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
#REDQUARK_VERSION = keyboard_test
#REDQUARK_VERSION = locale_menu
#REDQUARK_VERSION = locale_integrations
#REDQUARK_VERSION = pre-save-load
#REDQUARK_VERSION = save_load
#REDQUARK_VERSION = frame_drop_handler
#REDQUARK_VERSION = more_save_load_test
#REDQUARK_VERSION = load_save_ui
#REDQUARK_VERSION = embedded_fonts
REDQUARK_VERSION = v1.0.0-rc13
#REDQUARK_VERSION = split_emu
#REDQUARK_VERSION = vice-2_4_33-merge
#REDQUARK_LICENSE = the64 license
#REDQUARK_LICENSE_FILES = README
REDQUARK_INSTALL_STAGING = NO

REDQUARK_LICENSE = GPLv2+
REDQUARK_LICENSE_FILES = $(addprefix $(REDQUARK_SRC_SUBDIR)/,LICENSE LICENSE.FREETYPE-GL COPYING.VICE)

$(eval $(autotools-package))
