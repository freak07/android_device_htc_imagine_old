# config.mk
#
# Product-specific compile-time definitions
#
TARGET_BOARD_PLATFORM := sdm845
TARGET_BOOTLOADER_BOARD_NAME := SDM845

TARGET_USES_AOSP := true
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := krait

TARGET_NO_BOOTLOADER := true

-include $(QCPATH)/common/sdm845/BoardConfigVendor.mk

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3938451456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 52965670912
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
ifneq ($(TARGET_USES_AOSP),true)
TARGET_USES_QCOM_BSP := true
endif

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 user_debug=31 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3 androidboot.hardware=htc_ime androidkey.dummy=1 buildvariant=eng androidboot.selinux=permissive

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --second_offset 0x00f00000 --tags_offset 0x00000100 --board recovery:0

TARGET_PREBUILT_KERNEL := device/htc/$(TARGET_DEVICE)/kernel

# TWRP specific build flags
AB_OTA_UPDATER := true

#TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

#Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := true

#TARGET_LDPRELOAD := libNimsWrap.so

# TARGET_COMPILE_WITH_MSM_KERNEL := true

-include device/htc/$(TARGET_DEVICE)/BoardConfigTWRP.mk
-include vendor/htc/$(TARGET_DEVICE)/BoardConfigVendor.mk

