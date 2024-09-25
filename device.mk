#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

DERP_BUILDTYPE=Official
DERP_VERSION_APPEND_TIME_OF_DAY=true
TARGET_NOT_USES_BLUR=true
TARGET_USES_PICO_GAPPS=true

# Characteristics
PRODUCT_CHARACTERISTICS := tablet

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 2560

# Init
PRODUCT_PACKAGES += \
   init.gts9wifi.rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResGts9wifi \
    Gts9wifiSettingsResTarget \
    Gts9wifiSystemUIResTarget

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Fingerprint
PRODUCT_PACKAGES += \
    init.udfps.rc

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/samsung/sm8550-common/common.mk)


# Inherit the proprietary files
$(call inherit-product, vendor/samsung/gts9wifi/gts9wifi-vendor.mk)
