import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    Button{
        x: 3*window.width/4 - width/2
        y: 3*window.height/4 - height/2
        width: 80
        height: 25
        text: "RESET"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //chart.source ="chartWork.qml"
                myTimer.clickReset()
                listValues.clickReset()
            }
        }
    }
}
