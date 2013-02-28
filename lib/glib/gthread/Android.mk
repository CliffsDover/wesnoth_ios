LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES :=			\
	gthread-impl.c \
	$(NULL)

LOCAL_MODULE := gthread

LOCAL_C_INCLUDES :=			\
	$(GLIB_TOP)/android-internal	\
	$(NULL)

LOCAL_CFLAGS :=				\
	-DHAVE_CONFIG_H			\
    -DG_LOG_DOMAIN=\"GThread\"		\
    -D_POSIX4_DRAFT_SOURCE		\
    -D_POSIX4A_DRAFT10_SOURCE		\
    -U_OSF_SOURCE			\
    -DG_DISABLE_DEPRECATED  \
	$(NULL)

LOCAL_LIBRARIES := \
	glib \
	$(NULL)

LOCAL_SHARED_LIBRARIES := $(filter-out $(APP_AVAILABLE_STATIC_LIBS), $(LOCAL_LIBRARIES))
LOCAL_STATIC_LIBRARIES := $(filter $(APP_AVAILABLE_STATIC_LIBS), $(LOCAL_LIBRARIES))

LOCAL_EXPORT_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(NULL)

LOCAL_LDLIBS := 

ifeq (,$(findstring $(LOCAL_MODULE), $(APP_AVAILABLE_STATIC_LIBS)))
include $(BUILD_SHARED_LIBRARY)
else
include $(BUILD_STATIC_LIBRARY)
endif

