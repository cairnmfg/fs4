################################################################################
#
# puredata
#
################################################################################

PUREDATA_VERSION = 0.54-1
PUREDATA_SOURCE = pd-$(PUREDATA_VERSION).src.tar.gz
PUREDATA_SITE = http://msp.ucsd.edu/Software
PUREDATA_INSTALL_STAGING = YES
PUREDATA_INSTALL_TARGET = YES
PUREDATA_AUTORECONF = YES
PUREDATA_CONF_OPTS = --enable-debug --enable-alsa --disable-portaudio --disable-jack --disable-oss --without-local-portaudio --without-local-portmidi
PUREDATA_DEPENDENCIES = alsa-lib alsa-utils gettext tcl

define PUREDATA_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef

PUREDATA_PRE_CONFIGURE_HOOKS += PUREDATA_RUN_AUTOGEN

$(eval $(autotools-package))
