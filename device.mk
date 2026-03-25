#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Tablet
TARGET_IS_TABLET := true
TARGET_IS_WIFI-ONLY := true

# Characteristics
PRODUCT_CHARACTERISTICS := tablet

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 2560

# Set boot animation orientation and default display rotation to be landscape.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.bootanim.set_orientation_logical_0=ORIENTATION_90

# Init
PRODUCT_PACKAGES += \
    init.gts9wifi.rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Samsung IDC files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/idc/,$(TARGET_COPY_OUT_VENDOR)/usr/idc)

# ANGLE
PRODUCT_PACKAGES += \
    ANGLE

# SamsungParts
PRODUCT_PACKAGES += \
   SPenActions \
   vendor.samsung.hardware.spen-service

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch-service.samsung

# Tablet core
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# FOD
$(call soong_config_set,samsungUdfpsVars,udfps_zorder,0x20000000u)
$(call soong_config_set,samsungUdfpsVars,dim_layer_zorder,0x20000001u)
$(call soong_config_set,qtidisplay,samsung_udfps,true)
$(call soong_config_set,surfaceflinger,udfps_lib,//hardware/samsung:libudfps_extension.samsung)
$(call soong_config_set,samsungTouchVars,enableGloveMode,true)
$(call soong_config_set,samsungTouchVars,enableHighTouchPollingRate,true)
$(call soong_config_set,samsungTouchVars,enableStylusMode,false)
# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/samsung/sm8550-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/samsung/gts9wifi/gts9wifi-vendor.mk)