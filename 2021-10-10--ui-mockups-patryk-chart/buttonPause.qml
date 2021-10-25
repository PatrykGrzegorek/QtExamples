import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    Button{
        x: window.width/4 - width/2
        y: 3*window.height/4 - height/2
        width: 80
        height: 40
        text: "PAUSE"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                myTimer.clickStop()
                listValues.clickStop()
                stats.clickStop()
                firstButton.source="buttonStart.qml"
            }
        }
    }
}
