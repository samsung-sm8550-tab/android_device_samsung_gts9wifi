#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from gts9wifi device
$(call inherit-product, device/samsung/gts9wifi/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_DEVICE := gts9wifi
PRODUCT_NAME := lineage_gts9wifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-X710
PRODUCT_MANUFACTURER := samsung

## S Pen
TARGET_HAVE_SPEN := true

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc=$(call normalize-path-list,"gts9wifixx-user 14 UP1A.231005.007 X710XXU4BXHB release-keys") \
    BuildFingerprint="samsung/gts9wifixx/gts9wifi:14/UP1A.231005.007/X710XXU4BXHB:user/release-keys" 
    DeviceProduct=gts9wifixx \
    SystemName=gts9wifixx