#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# API levels
PRODUCT_SHIPPING_API_LEVEL := 29

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := phone

# Rootdir
PRODUCT_PACKAGES += \
    gps.sh \
    enable_test_mode.sh \
    install-recovery.sh \
    mx_log_collection.sh \
    mx_logger_dump.sh \
    scsc_get_platform_info.sh \

PRODUCT_PACKAGES += \
    fstab.exynos850 \
    init.recovery.exynos850.rc \
    init.recovery.samsung.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.exynos850:$(TARGET_COPY_OUT_RAMDISK)/fstab.exynos850

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a21s/a21s-vendor.mk)
