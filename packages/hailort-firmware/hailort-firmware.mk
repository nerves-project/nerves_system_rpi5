################################################################################
#
# hailort-firmware
#
################################################################################

HAILORT_FIRMWARE_VERSION = 4.20.0
HAILORT_FIRMWARE_SITE = https://hailo-hailort.s3.eu-west-2.amazonaws.com/Hailo8/$(HAILORT_FIRMEWARE_VERSION)/FW/
HAILORT_FIRMWARE_SOURCE = hailo8_fw.$(HAILORT_FIRMWARE_VERSION).bin
HAILORT_FIRMWARE_LICENSE = Proprietary

define HAILO_FIRMWARE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/$(HAILO_FIRMWARE_SOURCE) \
		$(TARGET_DIR)/lib/firmware/hailo/hailo8_fw.bin
endef

$(eval $(generic-package))
