################################################################################
#
# the64
#
################################################################################

THE64_SITE_METHOD = git
THE64_SITE = ssh://git@bitbucket.org:ZXDesign/the64-firmware
THE64_VERSION = 0.1.1
THE64_LICENSE = the64 license
THE64_LICENSE_FILES = README
THE64_INSTALL_STAGING = NO

define THE64_CONFIGURE_CMDS
	(cd $(@D); rm -rf config.cache; \
		$(TARGET_CONFIGURE_ARGS) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(THE64_PIC)" \
		./configure \
		--prefix=/usr \
	)
endef

define THE64_BUILD_CMDS
	$(MAKE1) -C $(@D)
endef

define THE64_INSTALL_STAGING_CMDS
	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
endef

define THE64_INSTALL_TARGET_CMDS
	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
endef

define HOST_THE64_INSTALL_CMDS
	$(MAKE1) -C $(@D) LDCONFIG=true install
endef

$(eval $(generic-package))
