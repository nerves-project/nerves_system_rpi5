################################################################################
#
# spdlog_hailort
#
################################################################################

SPDLOG_HAILORT_VERSION = 1.14.1
SPDLOG_HAILORT_SITE = $(call github,gabime,spdlog,v$(SPDLOG_HAILORT_VERSION))
SPDLOG_HAILORT_LICENSE = MIT
SPDLOG_HAILORT_LICENSE_FILES = LICENSE
SPDLOG_HAILORT_INSTALL_STAGING = YES
SPDLOG_HAILORT_CONF_OPTS += \
        -DSPDLOG_BUILD_TESTS=OFF \
        -DSPDLOG_BUILD_EXAMPLE=OFF \
        -DSPDLOG_BUILD_BENCH=OFF

ifeq ($(BR2_STATIC_LIBS),y)
SPDLOG_HAILORT_CONF_OPTS += -DSPDLOG_BUILD_SHARED=OFF
else
SPDLOG_HAILORT_CONF_OPTS += -DSPDLOG_BUILD_SHARED=ON
endif


$(eval $(cmake-package))
