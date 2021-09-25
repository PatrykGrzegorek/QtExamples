#ifndef STATS_H
#define STATS_H

#include <QObject>
#include <QTimer>

class stats: public QObject
{
    Q_OBJECT
    Q_PROPERTY( QString stringCalories READ stringCalories NOTIFY statsChanged)

public:
    explicit stats(QObject *parent = nullptr);

    void setStats(int heart);
    QString stringCalories();

signals:
    void statsChanged();
public slots:
    void changeStats();

    void clickStop();
    void clickStart();
    void clickReset();
private:
    int m_calories;
    QTimer *m_timer;
};

#endif // STATS_H
