#-------------------------------------------------
#
# Project created by QtCreator 2015-07-07T21:06:57
#
#-------------------------------------------------

##
## Pre-defined global variables
##

CONFIG(debug, debug|release) {
    DIR_SUFFIX = d
} else {
    DIR_SUFFIX =
}

!contains(QMAKE_HOST.arch, x86_64) {
    X64_BIN_DIR = ../bin/x32$${DIR_SUFFIX}         # Relative BIN path, 32-bit
    X64_GEN_DIR = ../gui_build/out32$${DIR_SUFFIX} # QMake temporary generated files, placed inside the build folder. (OBJ, UI, MOC)
    QMAKE_EXTENSION_SHLIB = dp32
} else {
    X64_BIN_DIR = ../bin/x64$${DIR_SUFFIX}         # Relative BIN path, 64-bit
    X64_GEN_DIR = ../gui_build/out64$${DIR_SUFFIX} # QMake temporary generated files, placed inside the build folder. (OBJ, UI, MOC)
    QMAKE_EXTENSION_SHLIB = dp64
}

##
## QMake output directories
##
DESTDIR = $${X64_BIN_DIR}

QT       += core gui widgets

#generate debug symbols in release mode
QMAKE_CFLAGS_RELEASE += -Zi
QMAKE_LFLAGS_RELEASE += /DEBUG

# http://www.hexblog.com/?p=991
QMAKE_CXXFLAGS += -DQT_NO_UNICODE_LITERAL

TARGET = ExpoMon
TEMPLATE = lib
LIBS += -luser32 -lshlwapi -lwinmm -L"$$PWD/PluginSdk" -L"$$PWD/PluginSdk/TitanEngine"

!contains(QMAKE_HOST.arch, x86_64) {
    LIBS += -lx32dbg -lx32bridge -lTitanEngine_x86
} else {
    LIBS += -lx64dbg -lx64bridge -lTitanEngine_x64
}

SOURCES +=\
    QtExpoMonAbout.cpp \
    QtExpoMon.cpp \
    DllMain.cpp \
    ExpoMon.cpp \
    DllExports.cpp

HEADERS  += \
    resource.h \
    Utils.h \
    WinInternals.h \
    QtExpoMon.h \
    QtExpoMonAbout.h \
    ExpoMon.h

FORMS    += \
    QtExpoMon.ui \
    QtExpoMonAbout.ui

RESOURCES += \
    ExpoMon.qrc \
    ExpoMon.rc
