#ifndef HEART_H
#define HEART_H

#include <QObject>
#include <QTimer>

class heart : public QObject
{
    Q_OBJECT
    Q_PROPERTY( QString stringHeart READ stringHeart NOTIFY statsChanged)

public:
    explicit heart(QObject *parent = nullptr);

    void setStats(int heart);
    QString stringHeart();

signals:
    void statsChanged();
public slots:
    void changeStats();

    void clickStop();
    void clickStart();
    void clickReset();
private:
    int m_heart;
    QTimer *m_timer;
};

#endif // HEART_H
