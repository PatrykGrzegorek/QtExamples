#include "mytimer.h"

myTimer::myTimer(QObject *parent) : QObject(parent), m_timer { new QTimer(this) }
{
    connect(m_timer, &QTimer::timeout, this, &myTimer::changeTime);
    m_timer->setInterval(1000);
    m_s = 0;
    m_m = 0;
    m_h = 0;
    m_stringTime = "0:00:00";
}

QString myTimer::stringTime()
{
    return m_stringTime;
}

void myTimer::setStringTime(QString stringTime)
{
    if(m_stringTime == stringTime){
        return;
    }
    m_stringTime = stringTime;
    emit timeChanged(m_stringTime);
}

void myTimer::changeTime()
{
    QString stringTime;
    m_s++;
    if(m_s==60){
        m_m++;
        m_s=0;
    }
    if(m_m==60){
        m_h++;
        m_m=0;
    }

    stringTime = QString::number(m_h)+":";
    if(m_m>9){
        stringTime +=QString::number(m_m)+":";
    }
    else{
        stringTime +="0"+QString::number(m_m)+":";
    }
    if(m_s>9){
        stringTime +=QString::number(m_s);
    }
    else{
        stringTime +="0"+QString::number(m_s);
    }
    setStringTime(stringTime);
}

void myTimer::clickStop()
{
    m_timer->stop();
}

void myTimer::clickStart()
{
    m_timer->start();
}

void myTimer::clickReset()
{
    m_s = -1;
    m_m = 0;
    m_h = 0;
    changeTime();
}
