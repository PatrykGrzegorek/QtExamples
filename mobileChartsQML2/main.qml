import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

ApplicationWindow {
    id: window
    width: 350
    height: 600
    visible: true
    title: qsTr("Humor")

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

    Rectangle{
        x: window.width/4 - width/2
        y: 60
        width: 100
        height: 50
        Text{
        anchors.centerIn: parent
        text: "Heart: " + heart.stringHeart
        }
    }

    Rectangle{
        x: 3*window.width/4 - width/2
        y: 60
        width: 100
        height: 50
        Text{
        anchors.centerIn: parent
        text: "Calories: " + stats.stringCalories
        }
    }

    Loader{
        id: chart
        source: "chart.qml"
    }

    Loader{
        id: firstButton
        source: "buttonFirstStart.qml"
    }

    Loader{
        active: false
        id: secondButton
        source: "buttonStop.qml"
    }
}
