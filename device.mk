#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

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

# Fingerprint
PRODUCT_PACKAGES += \
    init.udfps.rc

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/samsung/sm8550-common/common.mk)


# Inherit the proprietary files
$(call inherit-product, vendor/samsung/gts9wifi/gts9wifi-vendor.mk)
