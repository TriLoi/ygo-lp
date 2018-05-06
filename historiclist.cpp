#include "historiclist.h"

HistoricList::HistoricNode::HistoricNode(int lpj1, int lpj2, QString op, int damage, HistoricNode* previous):
    m_lpj1(lpj1), m_lpj2(lpj2), m_op(op), m_damage(damage), m_previous(previous), m_next(0)
{
    if(this->m_previous != 0)
    {
        this->m_previous->m_next = this;
    }
}

HistoricList::HistoricList():
    m_current(0), m_list(0)
{

}

HistoricList::~HistoricList()
{
    this->destroyAll();
}

const int & HistoricList::getCurrentLpj1()
{
    return this->m_current->m_lpj1;
}

const int & HistoricList::getCurrentLpj2()
{
    return this->m_current->m_lpj2;
}

const QString & HistoricList::getCurrentOp()
{
    return this->m_current->m_op;
}

const int & HistoricList::getCurrentDamage()
{
    return this->m_current->m_damage;
}

void HistoricList::addNode(int lpj1, int lpj2, QString op, int damage)
{
    this->m_list = new HistoricNode(lpj1, lpj2, op, damage, this->m_list);
    this->m_current = this->m_list;
}

void HistoricList::forwardCurrent(int steps)
{
    HistoricNode *n = this->m_current;

    for(int i=0; i<steps && n!=0; i++)
    {
        n = n->m_next;
    }

    if(n != 0)
    {
        this->m_current = n;
    }
}

void HistoricList::backCurrent(int steps)
{
    HistoricNode *n = this->m_current;

    for(int i=0; i<steps && n!=0; i++)
    {
        n = n->m_previous;
    }

    if(n != 0)
    {
        this->m_current = n;
    }
}

void HistoricList::destroyUntilCurrent()
{
    HistoricNode *n;
    while(this->m_list != this->m_current)
    {
        n = this->m_list;
        this->m_list = this->m_list->m_previous;
        delete n;
    }
}

void HistoricList::destroyAll()
{
    this->m_current = 0;
    this->destroyUntilCurrent();
}
