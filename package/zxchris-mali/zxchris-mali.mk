################################################################################
#
# sunxi-mali
#
################################################################################

# last sha1 character dropped to ensure unique filename
ZXCHRIS_MALI_VERSION = 33354e4c806e9ed2881e937f71410922cf1f04e
ZXCHRIS_MALI_SITE = https://github.com/zxchris/sunxi-mali
ZXCHRIS_MALI_SITE_METHOD = git

# Get the sunxi-mali-proprietary libraries
ZXCHRIS_MALI_GIT_SUBMODULES = YES

ZXCHRIS_MALI_INSTALL_STAGING = YES
ZXCHRIS_MALI_DEPENDENCIES = libump
ZXCHRIS_MALI_PROVIDES = libegl libgles

# The options below must be provided in the environment.  Providing these
# through options overrides the value and prevents the makefiles from
# appending to these variables.  This is used throughout the sunxi-mali build
# system.
#
# Furthermore, the -lm -dl -lpthread options are included due to a possible bug
# in the way the linaro 2013.06 toolchain handles shared libraries.
ZXCHRIS_MALI_MAKE_ENV = \
	CC="$(TARGET_CC)" \
	CFLAGS="$(TARGET_CFLAGS) -lm -ldl -lpthread" \
	$(TARGET_MAKE_ENV)

ifeq ($(BR2_ARM_EABIHF),y)
ZXCHRIS_MALI_MAKE_OPTS += ABI=armhf
else
ZXCHRIS_MALI_MAKE_OPTS += ABI=armel
endif

ZXCHRIS_MALI_MAKE_OPTS += EGL_TYPE=framebuffer

ifeq ($(BR2_PACKAGE_ZXCHRIS_MALI_R2P4),y)
ZXCHRIS_MALI_MAKE_OPTS += VERSION=r2p4
endif
ifeq ($(BR2_PACKAGE_ZXCHRIS_MALI_R3P0),y)
ZXCHRIS_MALI_MAKE_OPTS += VERSION=r3p0
endif
ifeq ($(BR2_PACKAGE_ZXCHRIS_MALI_R3P1),y)
ZXCHRIS_MALI_MAKE_OPTS += VERSION=r3p1
endif
ifeq ($(BR2_PACKAGE_ZXCHRIS_MALI_R3P2),y)
ZXCHRIS_MALI_MAKE_OPTS += VERSION=r3p2-01rel1
endif
ifeq ($(BR2_PACKAGE_ZXCHRIS_MALI_R4P0),y)
ZXCHRIS_MALI_MAKE_OPTS += VERSION=r4p0-00rel0
endif

define ZXCHRIS_MALI_BUILD_CMDS
	$(ZXCHRIS_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(ZXCHRIS_MALI_MAKE_OPTS) all
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/version/version \
		$(@D)/version/version.c
endef

define ZXCHRIS_MALI_INSTALL_STAGING_CMDS
	$(ZXCHRIS_MALI_MAKE_ENV) $(MAKE) -C $(@D) \
		$(ZXCHRIS_MALI_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
	# test must be built after install because it depends on headers that are
	# generated during the install above.
	$(ZXCHRIS_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(ZXCHRIS_MALI_MAKE_OPTS) test
#	$(INSTALL) -D -m 0644 package/sunxi-mali/egl.pc \
#		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
#	$(INSTALL) -D -m 0644 package/sunxi-mali/glesv2.pc \
#		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
endef

define ZXCHRIS_MALI_INSTALL_TARGET_CMDS
	$(ZXCHRIS_MALI_MAKE_ENV) $(MAKE) -C $(@D)/lib \
		$(ZXCHRIS_MALI_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
	$(if $(BR2_PACKAGE_ZXCHRIS_MALI_DBG),
		$(INSTALL) -m 755 $(@D)/version/version $(TARGET_DIR)/usr/bin/maliver; \
		$(INSTALL) -m 755 $(@D)/test/test $(TARGET_DIR)/usr/bin/malitest
	)
endef

define ZXCHRIS_MALI_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/zxchris-mali/S80mali \
		$(TARGET_DIR)/etc/init.d/S80mali
endef

$(eval $(generic-package))
