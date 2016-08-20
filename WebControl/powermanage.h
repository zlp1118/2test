#ifndef POWERMANAGE_H
#define POWERMANAGE_H

#include <QObject>
#include <QQmlEngine>

class PowerManage : public QObject
{
    Q_OBJECT
public:
    explicit PowerManage(QObject *parent = 0);

signals:

public slots:
    bool shutDown();
    bool sleep();
    bool restart();
    bool logout();
};

extern QObject *PowerManage_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine);
#endif // POWERMANAGE_H
