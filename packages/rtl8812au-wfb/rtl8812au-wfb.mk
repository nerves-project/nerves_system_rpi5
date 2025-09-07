################################################################################
#
# rtl8812au-wfb
#
################################################################################

RTL8812AU_WFB_SITE = $(call github,svpcom,rtl8812au,$(RTL8812AU_WFB_VERSION))
RTL8812AU_WFB_VERSION = 4d45664397fb086f77ecc1604fc605c851d3cb75

RTL8812AU_WFB_LICENSE = GPL-2.0
RTL8812AU_WFB_LICENSE_FILES = LICENSE 

RTL8812AU_WFB_MODULE_MAKE_OPTS = CONFIG_RTL8812AU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
