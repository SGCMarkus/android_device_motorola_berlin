#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BOARD_VENDOR := motorola

DEVICE_PATH := device/motorola/berlin

-include vendor/motorola/berlin/BoardConfigVendor.mk

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lahaina
TARGET_NO_BOOTLOADER := true

BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.memcg=1 lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += swiotlb=0 loop.max_part=7 cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += pcie_ports=compat loop.max_part=7 iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1 androidboot.hab.csv=0
BOARD_KERNEL_CMDLINE += androidboot.hab.product=berlin androidboot.hab.cid=50
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc LLVM=1
TARGET_KERNEL_SOURCE := kernel/motorola/sm7325
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG :=

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(COMMON_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(COMMON_PATH)/modules.load.recovery))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(COMMON_PATH)/modules.load.recovery))

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := lahaina

# Properties
TARGET_ODM_PROP += $(COMMON_PATH)/odm.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# Audio
AUDIO_FEATURE_ENABLED_AHAL_EXT := false
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := false
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_GKI := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := false
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
TARGET_USE_QTI_BT_STACK := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Display
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_DRM_PP := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(DEVICE_PATH)/device_framework_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_MANIFEST_SKUS := yupik
DEVICE_MANIFEST_YUPIK_FILES := manifest_yupik.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 102247673856
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 958769746
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1585767881
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 46080000
endif
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := product system system_ext vendor
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 7142899712
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 14294188032
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-07-01

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk