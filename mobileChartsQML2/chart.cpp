#include "chart.h"

chart::chart(QObject *parent) : QObject(parent), m_timer { new QTimer(this) }
{
    connect(m_timer, &QTimer::timeout, this, &chart::changeListValues);
    m_timer->setInterval(1000);
}

int chart::value(const int index) const{
    return m_listValues[index];
}

QList<int> chart::listValues()
{
    return m_listValues;
}

QList<QVariant> chart::variantListValuesGreen(){
    QList<QVariant> variantValues;
    for(int i = 0; i < this->count(); i++){
        variantValues.push_back(m_listValuesGreen[i]);
    }
    return variantValues;
}

QList<QVariant> chart::variantListValuesRed(){
    QList<QVariant> variantValues;
    for(int i = 0; i < this->count(); i++){
        variantValues.push_back(m_listValuesRed[i]);
    }
    return variantValues;
}

void chart::addValue(int value)
{

    emit listValuesChanged(value);
}

void chart::changeListValues()
{
    int value = rand() % 9 + 51;
    if(value > 54){
        m_listValuesGreen.push_back(value);
        m_listValuesRed.push_back(0);
    }else{
        m_listValuesRed.push_back(value);
        m_listValuesGreen.push_back(0);
    }
    m_listValues.push_back(value);
    addValue(value);
}

int chart::count(){
    return m_listValues.count();
}

void chart::clickStop()
{
    m_timer->stop();
}

void chart::clickStart()
{
    m_timer->start();
}

void chart::clickReset()
{
    m_listValues.clear();
    emit listValuesChanged(0);
}
