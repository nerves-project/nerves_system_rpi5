################################################################################
#
# ffmpeg-rpi (RPi fork of FFmpeg)
#
################################################################################

FFMPEG_RPI_SITE = https://github.com/jc-kynesim/rpi-ffmpeg.git
FFMPEG_RPI_VERSION = test/7.1.1/main   # or test/7.1/main
FFMPEG_RPI_SITE_METHOD = git

FFMPEG_RPI_LICENSE = LGPL-2.1+,GPL-2.0+
FFMPEG_RPI_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1 COPYING.LGPLv3

# ensure headers + libs land in SYSROOT (staging)
FFMPEG_RPI_INSTALL_STAGING = YES

# add what you actually need
FFMPEG_RPI_DEPENDENCIES = host-pkgconf zlib libdrm eudev libv4l

# minimal options; tweak as required
FFMPEG_RPI_CONF_OPTS = \
	--prefix=/usr \
	--enable-cross-compile \
	--enable-gpl --enable-version3 \
	--enable-v4l2-request \
	--enable-sand \
	--enable-libdrm --enable-libudev \
	--disable-doc --disable-debug \
	--disable-ffplay

HOST_FFMPEG_RPI_CONF_OPTS = \
	--prefix=$(HOST_DIR) \
	--enable-gpl --enable-version3 \
	--enable-libdrm --enable-libudev \
	--enable-v4l2-request \
	--enable-sand \
	--disable-doc --disable-debug \
	--disable-ffplay

# FFmpeg has its own ./configure; override only CONFIGURE
define FFMPEG_RPI_CONFIGURE_CMDS
	(cd $(@D) && rm -f config.cache && \
		$(TARGET_CONFIGURE_OPTS) \
		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
		./configure \
			--enable-cross-compile \
			--arch=$(BR2_ARCH) \
			--target-os=linux \
			--sysroot=$(STAGING_DIR) \
			--cc="$(TARGET_CC)" \
			--cxx="$(TARGET_CXX)" \
			--cross-prefix="$(TARGET_CROSS)" \
			--pkg-config="$(PKG_CONFIG_HOST_BINARY)" \
			$(if $(BR2_SHARED_LIBS),--enable-shared,--disable-shared) \
			$(if $(BR2_STATIC_LIBS),--enable-static,--disable-static) \
			$(FFMPEG_RPI_CONF_OPTS) )
endef

# Use system pkg-config and clear Buildroot overrides
define HOST_FFMPEG_RPI_CONFIGURE_CMDS
	(cd $(@D) && rm -f config.cache && \
		env -u PKG_CONFIG_LIBDIR -u PKG_CONFIG_PATH -u PKG_CONFIG_SYSROOT_DIR \
		PKG_CONFIG=pkg-config \
		./configure \
			--cc="$(HOSTCC)" \
			--cxx="$(HOSTCXX)" \
			--pkg-config=pkg-config \
			--prefix=$(HOST_DIR) \
			--enable-shared --enable-static \
			--enable-gpl --enable-version3 \
			--enable-libdrm --enable-libudev \
			--enable-v4l2-request --enable-sand \
			--disable-doc --disable-debug --disable-ffplay)
endef

#define HOST_FFMPEG_RPI_CONFIGURE_CMDS
#	(cd $(@D) && rm -f config.cache && \
#		$(HOST_CONFIGURE_OPTS) \
#		PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
#		./configure \
#			--cc="$(HOSTCC)" \
#			--cxx="$(HOSTCXX)" \
#			--pkg-config=/usr/bin/pkg-config \
#			--enable-shared --enable-static \
#			$(if $(BR2_SHARED_LIBS),--enable-shared,--disable-shared) \
#			$(if $(BR2_STATIC_LIBS),--enable-static,--disable-static) \
#			$(HOST_FFMPEG_RPI_CONF_OPTS))
#endef

define HOST_FFMPEG_RPI_INSTALL_CMDS
	$(MAKE) -C $(@D) install
	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(HOST_DIR)/bin/ffmpeg
	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(HOST_DIR)/bin/ffprobe
endef

# Buildroot's autotools-package will:
#  - build with:    $(MAKE) -C $(@D)
#  - install target:$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
#  - install stage: $(MAKE) -C $(@D) install DESTDIR=$(STAGING_DIR) (because *_INSTALL_STAGING=YES)
$(eval $(autotools-package))
$(eval $(host-autotools-package))
