#include "someClass.h"

User::User(const QString name, const int value):m_name(name), m_value(value){
}

QString User::getName() const{
    return m_name;
}

int User::getValue() const{
    return m_value;
}

void Database::addUser(const QString name, const int value){
    m_users.push_back(User(name, value));
}

int Database::count(){
    return m_users.count();
}

QString Database::takeName(const int index) const{
    return m_users[index].getName();
}

int Database::takeValue(const int index) const{
    return m_users[index].getValue();
}

QStringList Database::takeAllNames(){
    QStringList allNames;
    for(int i = 0; i < this->count(); i++){
        allNames.push_back(this->takeName(i));
    }
    return allNames;
}

QList<QVariant> Database::takeAllValues(){
    QList<QVariant> allValues;
    for(int i = 0; i < this->count(); i++){
        allValues.push_back(this->takeValue(i));
        qDebug()<<allValues.at(i);
    }
    return allValues;
}
