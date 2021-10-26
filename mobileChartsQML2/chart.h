#ifndef CHART_H
#define CHART_H

#include <QObject>
#include <QTimer>
#include <QList>
#include <random>
#include <QVariant>

class chart: public QObject
{
    Q_OBJECT
    Q_PROPERTY( QList<int> listValues READ listValues NOTIFY listValuesChanged)
    Q_PROPERTY( QList<QVariant> variantListValues READ variantListValues NOTIFY listValuesChanged)
    Q_PROPERTY( QList<QVariant> variantListValuesGreen READ variantListValuesGreen NOTIFY listValuesChanged)
    Q_PROPERTY( QList<QVariant> variantListValuesRed READ variantListValuesRed NOTIFY listValuesChanged)
    Q_PROPERTY( int count READ count NOTIFY listValuesChanged)

public:
    explicit chart(QObject *parent = nullptr);

    QList<int> listValues();
    QList<QVariant> variantListValues();
    QList<QVariant> variantListValuesGreen();
    QList<QVariant> variantListValuesRed();
    void addValue(int value);
    int count();

signals:
    void listValuesChanged(int value);
public slots:
    void changeListValues();

    int value(const int index) const;

    void clickStop();
    void clickStart();
    void clickReset();
private:
    QList<int> m_listValues;
    QList<int> m_listValuesGreen;
    QList<int> m_listValuesRed;
    QTimer *m_timer;
};

#endif // CHART_H
