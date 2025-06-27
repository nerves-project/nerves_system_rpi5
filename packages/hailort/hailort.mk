################################################################################
#
# hailort
#
################################################################################i

HAILORT_VERSION = 4.20.0
HAILORT_SITE = $(call github,hailo-ai,hailort,v$(HAILORT_VERSION))
HAILORT_LICENSE = MIT
HAILORT_LICENSE_FILES = hailort/LICENSE
HAILORT_SUPPORTS_IN_SOURCE_BUILD = NO

HAILORT_DEPENDENCIES = spdlog_hailort protobuf eigen

$(eval $(cmake-package))
