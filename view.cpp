#include "view.h"
#include <QGuiApplication>
#include <QScreen>

void View::concatDamageNumber(QString input)
{
    int value = this->m_damage_number;

    value *= 10;
    value += input.toInt();

    if(value < View::DAMAGE_MAX)
    {
        this->m_damage_number = value;
        this->updateView();
    }
}

bool View::changeDamageSign()
{
    if(this->m_damage_sign == "-")
    {
        this->m_damage_sign = "+";
    }
    else if(this->m_damage_sign == "+")
    {
        this->m_damage_sign = "/";
    }
    else
    {
        this->m_damage_sign = "-";
    }

    this->updateView();

    return true;
}

bool View::reset()
{
    this->m_damage_sign = View::DEFAULT_SIGN;
    this->m_damage_number = 0;
    emit resetLP();

    return true;
}

bool View::resetDamage()
{
    this->m_damage_sign = View::DEFAULT_SIGN;
    this->m_damage_number = 0;
    this->updateView();

    return true;
}

bool View::updateLPJ1()
{
    int damage = this->m_damage_number;
    QString sign = this->m_damage_sign;

    if(damage < View::DAMAGE_MIN){
        damage *= View::COEF_IF_MIN;
    }

    this->m_damage_sign = View::DEFAULT_SIGN;
    this->m_damage_number = 0;

    if(sign == "-")
    {
        emit removeToPlayer1(damage);
    }
    else if(sign == "+")
    {
        emit addToPlayer1(damage);
    }
    else if(sign == "/")
    {
        emit dividePlayer1(2);
    }

    return true;
}

bool View::updateLPJ2()
{
    int damage = this->m_damage_number;
    QString sign = this->m_damage_sign;

    if(damage < View::DAMAGE_MIN){
        damage *= View::COEF_IF_MIN;
    }

    this->m_damage_sign = View::DEFAULT_SIGN;
    this->m_damage_number = 0;

    if(sign == "-")
    {
        emit removeToPlayer2(damage);
    }
    else if(sign == "+")
    {
        emit addToPlayer2(damage);
    }
    else if(sign == "/")
    {
        emit dividePlayer2(2);
    }

    return true;
}

bool View::undo()
{
    emit undoBy(1);
    return true;
}

bool View::redo()
{
    emit redoBy(1);
    return true;
}

void View::update(int LPJ1, int LPJ2)
{
    this->m_lp1 = LPJ1;
    this->m_lp2 = LPJ2;
    this->updateView();
}

void View::updateView()
{
    this->setProperty("p_layout_buttons_enabled", this->m_damage_sign != "/");
    this->setProperty("p_damage_sign_text", this->m_damage_sign);

    if(this->m_damage_sign != "/")
    {
        this->setProperty("p_damage_number_text", this->m_damage_number);
    }
    else
    {
        this->setProperty("p_damage_number_text", 2);
    }
    this->setProperty("p_lp_j1_text", this->m_lp1);
    this->setProperty("p_lp_j2_text", this->m_lp2);
}
