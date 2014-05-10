LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# HAL module implemenation stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.product.board>.so
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_C_INCLUDES += \
    hardware/samsung_slsi/exynos4/include/

LOCAL_SRC_FILES:= \
	SecCamera.cpp SecCameraHWInterface.cpp

LOCAL_SHARED_LIBRARIES:= libutils libcutils libbinder liblog libcamera_client libhardware libhwjpeg

ifeq ($(TARGET_SOC), exynos4210)
LOCAL_SHARED_LIBRARIES += libs5pjpeg
LOCAL_CFLAGS += -DSAMSUNG_EXYNOS4210
endif

ifeq ($(TARGET_SOC), exynos4x12)
LOCAL_SHARED_LIBRARIES += libhwjpeg
LOCAL_CFLAGS += -DSAMSUNG_EXYNOS4x12
endif

LOCAL_MODULE := camera.$(TARGET_DEVICE)

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
