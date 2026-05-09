LDD_VERSION = 1.0
LDD_SITE = $(BR2_EXTERNAL_project_base_PATH)
LDD_SITE_METHOD = local

define LDD_BUILD_CMDS
    $(MAKE) -C $(LINUX_DIR) \
        M=$(TOPDIR)/../misc-modules \
        ARCH=$(KERNEL_ARCH) \
        CROSS_COMPILE=$(TARGET_CROSS) \
        modules

    $(MAKE) -C $(LINUX_DIR) \
        M=$(TOPDIR)/../scull \
        ARCH=$(KERNEL_ARCH) \
        CROSS_COMPILE=$(TARGET_CROSS) \
        modules
endef

define LDD_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)
    cp $(TOPDIR)/../misc-modules/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/
    cp $(TOPDIR)/../scull/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/
endef

$(eval $(generic-package))

