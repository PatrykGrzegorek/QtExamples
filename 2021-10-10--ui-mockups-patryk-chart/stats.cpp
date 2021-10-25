#include "stats.h"

stats::stats(QObject *parent): QObject(parent), m_timer { new QTimer(this) }
{
    connect(m_timer, &QTimer::timeout, this, &stats::changeStats);
    m_timer->setInterval(2000);
    m_calories=0;
}

void stats::setStats(int calories)
{
    m_calories += calories;
    emit statsChanged();
}

QString stats::stringCalories()
{
    return QString::number(m_calories);
}

void stats::clickStop()
{
    m_timer->stop();
}

void stats::clickStart()
{
    m_timer->start();
}

void stats::clickReset()
{
    m_calories = 0;
    emit statsChanged();
}

void stats::changeStats()
{
    int calories = rand() % 6 + 1;
    setStats(calories);
}
