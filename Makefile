ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
THEOS_BUILD_DIR = debs

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CopyVideoURL
CopyVideoURL_FILES = Tweak.xm
CopyVideoURL_FRAMEWORKS = UIKit MediaPlayer
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
