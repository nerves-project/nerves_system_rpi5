################################################################################
#
# hailort-drivers
#
################################################################################

HAILORT_DRIVERS_VERSION = 4.22.0
HAILORT_DRIVERS_SITE = $(call github,hailo-ai,hailort-drivers,v$(HAILORT_DRIVERS_VERSION))
HAILORT_DRIVERS_LICENSE = GPL-2.0
HAILORT_DRIVERS_LICENSE_FILES = LICENSE
HAILORT_DRIVERS_DEPENDENCIES = linux hailort

# Override the module directory to point to the PCIe driver location
HAILORT_DRIVERS_MODULE_SUBDIRS = linux/pcie

define HAILORT_DRIVERS_BUILD_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)/$(HAILORT_DRIVERS_MODULE_SUBDIRS) modules
endef

define HAILORT_DRIVERS_INSTALL_TARGET_CMDS
	# Remove old driver if it exists and make sure the directory exists
	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/media/pci/hailo
	rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/media/pci/hailo/hailo_pci.ko
	# Install new driver
	$(INSTALL) -D -m 0644 $(@D)/linux/pcie/hailo_pci.ko \
		$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/media/pci/hailo/hailo_pci.ko
endef

$(eval $(kernel-module))
$(eval $(generic-package))
