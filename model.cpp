#include "model.h"
#include <iostream>

Model::Model(QObject *parent) : QObject(parent)
{
    this->m_historic = new HistoricList();
}

Model::~Model()
{
    delete this->m_historic;
}

void Model::initialize()
{
    this->resetLP();
}

void Model::removeToPlayer1(int lp)
{
    if(lp != 0)
    {
        this->m_lpj1 = this->getCalculatedDamagedLP(this->m_lpj1, lp);
        this->addHistoricNode("-",lp);
        emit update(this->m_lpj1, this->m_lpj2);
    }
}

void Model::removeToPlayer2(int lp)
{
    if(lp != 0)
    {
        this->m_lpj2 = this->getCalculatedDamagedLP(this->m_lpj2, lp);
        this->addHistoricNode("-",lp);
        emit update(this->m_lpj1, this->m_lpj2);
    }
}

void Model::addToPlayer1(int lp)
{
    if(lp != 0)
    {
        this->m_lpj1 = this->getCalculatedRestoredLP(this->m_lpj1, lp);
        this->addHistoricNode("+",lp);
        emit update(this->m_lpj1, this->m_lpj2);
    }
}

void Model::addToPlayer2(int lp)
{
    if(lp != 0)
    {
        this->m_lpj2 = this->getCalculatedRestoredLP(this->m_lpj2, lp);
        this->addHistoricNode("+",lp);
        emit update(this->m_lpj1, this->m_lpj2);
    }
}

void Model::dividePlayer1(int coef)
{
    if(coef != 0)
    {
        this->m_lpj1 /= coef;
        this->addHistoricNode("/",coef);
        emit update(this->m_lpj1, this->m_lpj2);
    }
}

void Model::dividePlayer2(int coef)
{
    if(coef != 0)
    {
        this->m_lpj2 /= coef;
        this->addHistoricNode("/",coef);
        emit update(this->m_lpj1, this->m_lpj2);
    }
}

void Model::undoBy(int nbSteps)
{
    this->m_historic->backCurrent(nbSteps);
    this->m_lpj1 = this->m_historic->getCurrentLpj1();
    this->m_lpj2 = this->m_historic->getCurrentLpj2();
    emit update(this->m_lpj1, this->m_lpj2);
}

void Model::redoBy(int nbSteps)
{
    this->m_historic->forwardCurrent(nbSteps);
    this->m_lpj1 = this->m_historic->getCurrentLpj1();
    this->m_lpj2 = this->m_historic->getCurrentLpj2();
    emit update(this->m_lpj1, this->m_lpj2);
}

void Model::resetLP()
{
    this->m_historic->destroyAll();

    this->m_lpj1 = Model::LP_BASE;
    this->m_lpj2 = Model::LP_BASE;
    this->addHistoricNode("",0);

    emit update(this->m_lpj1, this->m_lpj2);
}

int Model::getCalculatedDamagedLP(int LP, int damage)
{
    LP -= damage;
    if(LP < Model::LP_MIN) return Model::LP_MIN;
    return LP;
}

int Model::getCalculatedRestoredLP(int LP, int restore)
{
    LP += restore;
    if(LP > Model::LP_MAX) return Model::LP_MAX;
    return LP;
}

void Model::addHistoricNode(QString op, int lp){
    this->m_historic->destroyUntilCurrent();
    this->m_historic->addNode(this->m_lpj1, this->m_lpj2, op, lp);
}
