import QtQuick 2.0

Item {
    Rectangle{
        x: window.width/2 - width/2
        y: 5
        width: 100
        height: 50
        Text{
        anchors.centerIn: parent
        text: myTimer.stringTime
        }
    }
}
