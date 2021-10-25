#include "heart.h"

heart::heart(QObject *parent): QObject(parent), m_timer { new QTimer(this) }
{
    connect(m_timer, &QTimer::timeout, this, &heart::changeStats);
    m_timer->setInterval(1000);
    m_heart=0;
}

void heart::setStats(int heart)
{
    m_heart = heart;
    emit statsChanged();
}

QString heart::stringHeart()
{
    return QString::number(m_heart);
}

void heart::clickStop()
{
    m_timer->stop();
}

void heart::clickStart()
{
    m_timer->start();
}

void heart::clickReset()
{
    m_heart = 0;
    emit statsChanged();
}

void heart::changeStats()
{
    int heart = rand() % 30 + 80;
    setStats(heart);
}
