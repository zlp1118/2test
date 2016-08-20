TEMPLATE = app

QT += qml quick websockets

CONFIG += c++11

SOURCES += main.cpp \
    echoserver.cpp \
    powermanage.cpp

RESOURCES += qml.qrc \
    images.qrc
target.path = $$[QT_INSTALL_EXAMPLES]/qtlabscontrols/gallery
INSTALLS += target
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    echoserver.h \
    powermanage.h

DISTFILES += \
    qml/main.qml
