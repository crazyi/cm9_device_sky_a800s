$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/sky/a800s/a800s-vendor.mk)

# DEVICE_PACKAGE_OVERLAYS += device/sky/a800s/overlay


#TODO ---- What do we need to do to not use a static init & init.rc?
PRODUCT_COPY_FILES += \
    device/sky/a800s/init:root/init \
    device/sky/a800s/init.rc:root/init.rc \
    device/sky/a800s/ueventd.rc:root/ueventd.rc \
    device/sky/a800s/init.qcom.rc:root/init.a800s.rc \
#    device/sky/a800s/ueventd.a800s.rc:root/ueventd.a800s.rc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/sky/a800s/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/sky/a800s/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/sky/a800s/keychars/ffa-keypad_numeric.kcm.bin:system/usr/keychars/ffa-keypad_numeric.kcm.bin \
    device/sky/a800s/keychars/ffa-keypad_qwerty.kcm.bin:system/usr/keychars/ffa-keypad_qwerty.kcm.bin \
    device/sky/a800s/keychars/fluid-keypad_numeric.kcm.bin:system/usr/keychars/fluid-keypad_numeric.kcm.bin \
    device/sky/a800s/keychars/fluid-keypad_qwerty.kcm.bin:system/usr/keychars/fluid-keypad_qwerty.kcm.bin \
    device/sky/a800s/keylayout/8660_handset.kl:system/usr/keylayout/8660_handset.kl \
    device/sky/a800s/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/sky/a800s/keylayout/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
    device/sky/a800s/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    device/sky/a800s/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/sky/a800s/firmware/BCM43291A0_003.001.013.0141.0000_Pantech_EF33S_EF34K_extLNA_TestOnly.hcd:system/bin/BCM43291A0_003.001.013.0141.0000_Pantech_EF33S_EF34K_extLNA_TestOnly.hcd \
    device/sky/a800s/firmware/bcm43291.bin:system/etc/wl/bcm43291.bin \
    device/sky/a800s/firmware/bcm43291_apsta.bin:system/etc/wl/bcm43291_apsta.bin \
    device/sky/a800s/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/sky/a800s/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/sky/a800s/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw

# Wifi Module
PRODUCT_COPY_FILES += \
    device/sky/a800s/modules/wlan.ko:system/lib/modules/wlan.ko \

PRODUCT_COPY_FILES += \
    device/sky/a800s/vold.fstab:system/etc/vold.fstab

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/sky/a800s/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_a800s
PRODUCT_DEVICE := a800s
