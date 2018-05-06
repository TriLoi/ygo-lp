#ifndef VIEW_H
#define VIEW_H

#include <QQuickWindow>
#include <QString>
#include <string>

class View : public QQuickWindow
{
    Q_OBJECT

    Q_PROPERTY(QString input_damage_number WRITE concatDamageNumber)
    Q_PROPERTY(bool change_damage_sign READ changeDamageSign)

    Q_PROPERTY(bool reset READ reset)
    Q_PROPERTY(bool reset_damage READ resetDamage)
    Q_PROPERTY(bool update_lpj1 READ updateLPJ1)
    Q_PROPERTY(bool update_lpj2 READ updateLPJ2)

    Q_PROPERTY(bool undo READ undo)
    Q_PROPERTY(bool redo READ redo)

public:
    void concatDamageNumber(QString input);
    bool changeDamageSign();

    bool reset();
    bool resetDamage();
    bool updateLPJ1();
    bool updateLPJ2();

    bool undo();
    bool redo();

signals:
    void removeToPlayer1(int);
    void removeToPlayer2(int);
    void addToPlayer1(int);
    void addToPlayer2(int);
    void dividePlayer1(int);
    void dividePlayer2(int);
    void resetLP();
    void undoBy(int);
    void redoBy(int);

public slots:
    void update(int, int);

private:
    const QString DEFAULT_SIGN = "-";
    static const int DAMAGE_MIN = 100;
    static const int COEF_IF_MIN = 100;
    static const int DAMAGE_MAX = 9999;

    int m_damage_number = 0;
    int m_lp1 = 0;
    int m_lp2 = 0;
    QString m_damage_sign = View::DEFAULT_SIGN;

    void updateView();
};

#endif // VIEW_H
