#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "mytimer.h"
#include "chart.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QApplication app(argc, argv);
    srand (time(NULL));
    //my Objects
    myTimer myTimer1;
    chart chart1;

    QQmlApplicationEngine engine;

    //connect my Objects to QML
    engine.rootContext()->setContextProperty("myTimer", &myTimer1);
    engine.rootContext()->setContextProperty("listValues", &chart1);

    //debuging lines
    QObject::connect(&myTimer1, &myTimer::timeChanged, [](QString stringTime) { qDebug() << "Time changed to " << stringTime; });
    QObject::connect(&chart1, &chart::listValuesChanged, [](int value) { qDebug() << "Add value " << QString::number(value); });


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
