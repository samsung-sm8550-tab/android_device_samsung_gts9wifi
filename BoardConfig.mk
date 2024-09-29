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

# Kernel
TARGET_KERNEL_CONFIG := gts9wifi_defconfig

TARGET_KERNEL_EXT_MODULES := \
  qcom/opensource/mmrm-driver \
  qcom/opensource/mm-drivers/hw_fence \
  qcom/opensource/mm-drivers/msm_ext_display \
  qcom/opensource/mm-drivers/sync_fence \
  qcom/opensource/audio-kernel \
  qcom/opensource/camera-kernel \
  qcom/opensource/dataipa/drivers/platform/msm \
  qcom/opensource/datarmnet/core \
  qcom/opensource/datarmnet-ext/aps \
  qcom/opensource/datarmnet-ext/offload \
  qcom/opensource/datarmnet-ext/shs \
  qcom/opensource/datarmnet-ext/perf \
  qcom/opensource/datarmnet-ext/perf_tether \
  qcom/opensource/datarmnet-ext/sch \
  qcom/opensource/datarmnet-ext/wlan \
  qcom/opensource/securemsm-kernel \
  qcom/opensource/display-drivers/msm \
  qcom/opensource/eva-kernel \
  qcom/opensource/video-driver \
  qcom/opensource/graphics-kernel \
  qcom/opensource/wlan/platform \
  qcom/opensource/wlan/qcacld-3.0/.qca6490 \
  qcom/opensource/bt-kernel
