#ifndef SOMECLASS_H
#define SOMECLASS_H

#include <QObject>
#include <QDate>
#include <QList>
#include <QDebug>
#include <QStringList>

class User{
    Q_GADGET
    Q_PROPERTY(QString name MEMBER m_name)
public:
    User(const QString name = QString(), const int value = int());

    QString getName() const;
    int getValue() const;
private:
    QString m_name;
    int m_value;
};

class Database : public QObject{
    Q_OBJECT
public:
    explicit Database(){m_users.push_back(User("Karin", 11));m_users.push_back(User("Nagataro", 19));};
    Q_INVOKABLE int count();
    Q_INVOKABLE QString takeName(const int index) const;
    Q_INVOKABLE int takeValue(const int index) const;
    Q_INVOKABLE QStringList takeAllNames();
    Q_INVOKABLE QList<QVariant> takeAllValues();
   // Q_INVOKABLE User makeUser(const QString& name);
    Q_INVOKABLE void addUser(const QString name, const int value);
private:
    QList<User> m_users;
};

#endif // SOMECLASS_H
