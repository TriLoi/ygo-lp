#ifndef MODEL_H
#define MODEL_H

#include <QObject>
#include "historiclist.h"

class Model : public QObject
{
    Q_OBJECT
public:
    explicit Model(QObject *parent = nullptr);
    ~Model();
    void initialize();

signals:
    void update(int damagePlayer1, int damagePlayer2);

public slots:
    void removeToPlayer1(int lp);
    void removeToPlayer2(int lp);
    void addToPlayer1(int lp);
    void addToPlayer2(int lp);
    void dividePlayer1(int coef);
    void dividePlayer2(int coef);
    void resetLP();
    void undoBy(int nbSteps);
    void redoBy(int nbSteps);

private:
    static const int LP_BASE = 8000;
    static const int LP_MIN = 0;
    static const int LP_MAX = 99999;

    int m_lpj1, m_lpj2;
    HistoricList* m_historic;

    int getCalculatedDamagedLP(int, int);
    int getCalculatedRestoredLP(int, int);
    void addHistoricNode(QString, int);
};

#endif // MODEL_H
