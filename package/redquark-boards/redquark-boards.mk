################################################################################
#
# redquark-boards - Derived from sunxi-boards
#
################################################################################

REDQUARK_BOARDS_VERSION = eaaf5a5b077f5223919e07b0989fff8b97f9b33
REDQUARK_BOARDS_SITE = $(call github,zxchris,sunxi-boards,$(REDQUARK_BOARDS_VERSION))
REDQUARK_BOARDS_DEPENDENCIES = host-sunxi-tools
REDQUARK_BOARDS_INSTALL_IMAGES = YES
REDQUARK_BOARDS_INSTALL_TARGET = NO
REDQUARK_BOARDS_FEX_FILE = $(call qstrip,$(BR2_PACKAGE_REDQUARK_BOARDS_FEX_FILE))

define REDQUARK_BOARDS_INSTALL_IMAGES_CMDS
	$(FEX2BIN) $(@D)/sys_config/$(REDQUARK_BOARDS_FEX_FILE) \
		$(BINARIES_DIR)/script.bin
endef

ifeq ($(BR2_PACKAGE_REDQUARK_BOARDS)$(BR_BUILDING),yy)
# we NEED a board name
ifeq ($(REDQUARK_BOARDS_FEX_FILE),)
$(error No sunxi .fex file specified. Check your BR2_PACKAGE_REDQUARK_BOARDS_FEX_FILE settings)
endif
endif

$(eval $(generic-package))
