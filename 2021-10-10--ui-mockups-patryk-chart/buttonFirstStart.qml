import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    Button{
        x: window.width/2 - width/2
        y: 3*window.height/4 - height/2
        width: 80
        height: 40
        text: "START"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                myTimer.clickReset()
                listValues.clickReset()
                stats.clickReset()
                myTimer.clickStart()
                listValues.clickStart()
                heart.clickStart()
                stats.clickStart()
                chart.source="chartWork.qml"
                firstButton.source="buttonPause.qml"
                secondButton.active=true
                secondButton.source="buttonStop.qml"
                timeStart = null
                timeStart = new Date()
            }
        }
    }
}
