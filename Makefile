ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:5.0

THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TWEAK_NAME = SlackOpenBinaries
SlackOpenBinaries_CFLAGS = -fobjc-arc
SlackOpenBinaries_FILES = SlackOpenBinaries.x
SlackOpenBinaries_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 slack"
