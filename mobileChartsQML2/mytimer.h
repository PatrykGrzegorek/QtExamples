#ifndef MYTIMER_H
#define MYTIMER_H

#include <QObject>
#include <QTimer>

class myTimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY( QString stringTime READ stringTime NOTIFY timeChanged)

public:
    explicit myTimer(QObject *parent = nullptr);

    void setStringTime(QString stringTime);
    QString stringTime();

signals:
    void timeChanged(QString stringTime);
public slots:
    void changeTime();

    void clickStop();
    void clickStart();
    void clickReset();
private:
    int m_s, m_m, m_h;
    QString m_stringTime;
    QTimer *m_timer;
};

#endif // MYTIMER_H
