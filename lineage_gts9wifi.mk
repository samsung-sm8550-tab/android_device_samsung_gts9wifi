#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit from gts9wifi device
$(call inherit-product, device/samsung/gts9wifi/device.mk)

PRODUCT_DEVICE := gts9wifi
PRODUCT_NAME := lineage_gts9wifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-X710
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gts9wifixx-user 14 UP1A.231005.007 X710XXS3BXE1 release-keys"

BUILD_FINGERPRINT := samsung/gts9wifixx/gts9wifi:13/TP1A.220624.014/X710XXS3BXE1:user/release-keys
