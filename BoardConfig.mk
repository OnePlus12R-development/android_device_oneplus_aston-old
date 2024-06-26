#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8550-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/aston

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5D35L1,OP5CF9L1

# Display
TARGET_SCREEN_DENSITY := 450

# DTBO
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img

# IR
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v33/arm64/arch-arm64-armv8-a/shared/vndk-core/android.hardware.ir-V1-ndk.so:$(TARGET_COPY_OUT_ODM)/lib64/android.hardware.ir-V1-ndk.so

# Kernel
TARGET_KERNEL_CONFIG += vendor/oplus/aston.config

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Vibrator
SOONG_CONFIG_NAMESPACES += OPLUS_LINEAGE_VIBRATOR_HAL
SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL := \
    USE_EFFECT_STREAM
SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL_USE_EFFECT_STREAM := true

# Include the proprietary files BoardConfig.
include vendor/oneplus/aston/BoardConfigVendor.mk
