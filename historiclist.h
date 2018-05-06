#ifndef HISTORICLIST_H
#define HISTORICLIST_H

#include <QString>

class HistoricList
{
public:
    HistoricList();
    ~HistoricList();

    const int & getCurrentLpj1();
    const int & getCurrentLpj2();
    const QString & getCurrentOp();
    const int & getCurrentDamage();

    void addNode(int lpj1, int lpj2, QString op, int damage);
    void forwardCurrent(int steps);
    void backCurrent(int steps);
    void destroyUntilCurrent();
    void destroyAll();

private:
    class HistoricNode
    {
    public:
        HistoricNode(int lpj1, int lpj2, QString op, int damage, HistoricNode* previous);

        int m_lpj1;
        int m_lpj2;
        QString m_op;
        int m_damage;
        HistoricNode* m_previous;
        HistoricNode* m_next;
    };

    HistoricNode* m_list;
    HistoricNode* m_current;
};

#endif // HISTORICLIST_H
