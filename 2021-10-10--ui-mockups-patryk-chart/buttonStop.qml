import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    Button{
        x: 3*window.width/4 - width/2
        y: 3*window.height/4 - height/2
        width: 80
        height: 40
        text: "STOP"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                timeStop = null
                timeStop = new Date()
                myTimer.clickStop()
                listValues.clickStop()
                stats.clickStop()
                chart.source ="chart.qml"
                firstButton.source="buttonFirstStart.qml"
                secondButton.active=false
            }
        }
    }
}
