#
# Copyright (C) 2011 The CyanogenMod Project
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

# common msm8960 configs
$(call inherit-product, device/htc/msm8960-common/msm8960.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay
#    $(LOCAL_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    $(LOCAL_PATH)/configs/com.htc.software.market.xml:system/etc/permissions/com.htc.software.market.xml \
    $(LOCAL_PATH)/configs/res_ctrl.conf:system/etc/res_ctrl.conf

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp_policy/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp_policy/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960 \
    Snap \
    libcamera_shim

# Camera HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    camera.device@1.0-impl

# Consumerir HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    $(LOCAL_PATH)/idc/max1187x_touchscreen_0.idc:system/usr/idc/max1187x_touchscreen_0.idc \
    $(LOCAL_PATH)/idc/Validity_Navigation_Sensor.idc:system/usr/idc/Validity_Navigation_Sensor.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    $(LOCAL_PATH)/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    $(LOCAL_PATH)/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    $(LOCAL_PATH)/keylayout/max1187x_touchscreen_0.kl:system/usr/keylayout/max1187x_touchscreen_0.kl \
    $(LOCAL_PATH)/keylayout/Validity_Navigation_Sensor.kl:system/usr/keylayout/Validity_Navigation_Sensor.kl

# Keymaster HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8960

# Log
PRODUCT_PACKAGES += \
    liblog_shim

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:system/etc/media_profiles_V1_0.xml

# NFC HAL
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl

# NFC
PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_ndef \
    libnfc_jni \
    libpn544_fw \
    Nfc \
    Tag \
    com.android.nfc_extras

ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/htc/t6-common/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/htc/t6-common/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# OMX properties
 PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Perf
PRODUCT_PACKAGES += \
    libshims_atomic

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl

# Qualcomm scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.qcom.bt.sh:/system/vendor/etc/init.qcom.bt.sh

# PowerHAL
PRODUCT_PACKAGES += \
    libqc-opt_shim

# Sensors HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.power.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.qcom.rc

# USB HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# RIL
PRODUCT_PACKAGES += \
    libshim_ril

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald.conf:system/etc/thermald.conf

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl

# Vibrator HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# Voice processing
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing

# WiFi
PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service

# WiFi HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Include non-opensource parts
$(call inherit-product-if-exists, vendor/htc/t6-common/t6-common-vendor.mk)

# Variant linking script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/variant_script.sh:install/bin/variant_script.sh
