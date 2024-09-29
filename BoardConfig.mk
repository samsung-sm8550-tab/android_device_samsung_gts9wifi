#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/samsung/sm8550-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/gts9wifi

# Assert
TARGET_OTA_ASSERT_DEVICE := gts9wifi

# Display
TARGET_SCREEN_DENSITY := 350