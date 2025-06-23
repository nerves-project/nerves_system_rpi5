################################################################################
#
# hailort
#
################################################################################i

HAILORT_VERSION = v4.20.0-build-nerves
HAILORT_SITE = https://github.com/cocoa-xu/hailort.git
HAILORT_SITE_METHOD = git
HAILORT_GIT_SUBMODULES = YES
HAILORT_LICENSE = MIT
HAILORT_LICENSE_FILES = hailort/LICENSE
HAILORT_SUPPORTS_IN_SOURCE_BUILD = NO

HAILORT_DEPENDENCIES = spdlog_hailort protobuf eigen

$(eval $(cmake-package))
