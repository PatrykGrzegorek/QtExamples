import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

ApplicationWindow {
    id: window
    width: 350
    height: 600
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: timer
        x: window.width/2 - width/2
        y: 5
        width: 100
        height: 50
        Text{
        anchors.centerIn: parent
        text: myTimer.stringTime
        }
    }

    Loader{
        id: chart
        source: "chartWork.qml"
    }

    Button{
        x: window.width/4 - width/2
        y: 3*window.height/4 - height/2
        width: 80
        height: 25
        text: "START"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                myTimer.clickStart()
                listValues.clickStart()
                chart.source="chartWork.qml"
            }
        }
    }

    Button{
        x: window.width/2 - width/2
        y: 3*window.height/4 - height/2
        width: 80
        height: 25
        text: "RESET"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                myTimer.clickReset()
                listValues.clickReset()
            }
        }
    }

    Button{
        x: 3*window.width/4 - width/2
        y: 3*window.height/4 - height/2
        width: 80
        height: 25
        text: "STOP"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                myTimer.clickStop()
                listValues.clickStop()
                chart.source ="chart.qml"
            }
        }
    }
}
