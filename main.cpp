#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "view.h";
#include "model.h";

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<View>("io.qt.view", 1, 0, "View");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject *v = engine.rootObjects().at(0);
    Model *m = new Model();

    QObject::connect(m, SIGNAL(update(int,int)), v, SLOT(update(int, int)));
    QObject::connect(v, SIGNAL(removeToPlayer1(int)), m, SLOT(removeToPlayer1(int)));
    QObject::connect(v, SIGNAL(removeToPlayer2(int)), m, SLOT(removeToPlayer2(int)));
    QObject::connect(v, SIGNAL(addToPlayer1(int)), m, SLOT(addToPlayer1(int)));
    QObject::connect(v, SIGNAL(addToPlayer2(int)), m, SLOT(addToPlayer2(int)));
    QObject::connect(v, SIGNAL(dividePlayer1(int)), m, SLOT(dividePlayer1(int)));
    QObject::connect(v, SIGNAL(dividePlayer2(int)), m, SLOT(dividePlayer2(int)));
    QObject::connect(v, SIGNAL(resetLP()), m, SLOT(resetLP()));
    QObject::connect(v, SIGNAL(undoBy(int)), m, SLOT(undoBy(int)));
    QObject::connect(v, SIGNAL(redoBy(int)), m, SLOT(redoBy(int)));
    m->initialize();

    return app.exec();
}
