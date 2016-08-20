#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>
#include <QSettings>
#include "echoserver.h"
#include "powermanage.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setOrganizationName("QtProject");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QSettings settings;
    qputenv("QT_LABS_CONTROLS_STYLE", settings.value("styles").toByteArray());

    qmlRegisterSingletonType<PowerManage>("fan.qt.complex", 1, 0, "PM", PowerManage_singletontype_provider);

    QQmlApplicationEngine engine;

    //viwer.setFlags(Qt::FramelessWindowHint);
    //    viwer.setColor(QColor(Qt::transparent));

    int port = 444;

    //EchoServer *server = new EchoServer(port);
    //QObject::connect(server, &EchoServer::closed, &app, &QCoreApplication::quit);

    //QQmlApplicationEngine engine;

    engine.rootContext() -> setContextProperty("__network__", new EchoServer(port));

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
