TEMPLATE = lib
CONFIG += qt plugin
QT += declarative
QT +=gui

DESTDIR += ../../plugin
OBJECTS_DIR = tmp
MOC_DIR = tmp

TARGET = EditorDeclarativePlugin

HEADERS += FileActions.h \
        EditorDeclarativePlugin.h

SOURCES += FileActions.cpp \
        EditorDeclarativePlugin.cpp
