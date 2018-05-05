#ifndef MODELE_H
#define MODELE_H

#include <QObject>

class modele : public QObject
{
    Q_OBJECT
public:
    explicit modele(QObject *parent = nullptr);

signals:

public slots:
};

#endif // MODELE_H