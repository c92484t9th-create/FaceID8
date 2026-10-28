ARCHS = arm64
TARGET = iphone:clang:16.5:15.0
THEOS_PACKAGE_SCHEME = rootless
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FaceID2D
FaceID2D_FILES = Tweak.xm
FaceID2D_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
