################################################################################
#
# spdlog_hailort
#
################################################################################i

SPDLOG_HAILORT_VERSION = v1.14.1
SPDLOG_HAILORT_SITE = https://github.com/gabime/spdlog.git
SPDLOG_HAILORT_SITE_METHOD = git
SPDLOG_HAILORT_GIT_SUBMODULES = YES
SPDLOG_HAILORT_LICENSE = MIT
SPDLOG_HAILORT_LICENSE_FILES = LICENSE

$(eval $(cmake-package))
