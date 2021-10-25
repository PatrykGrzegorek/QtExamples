import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3
import QtQuick.Controls.Material 2.12

Page {
    property variant timeStart: null
    property variant timeStop: null
    Rectangle{
        color: Material.background
        id: timer
        x: window.width/2 - width/2
        y: 10
        width: 100
        height: 50
        Text{

        color: Material.foreground
        anchors.centerIn: parent
        text: myTimer.stringTime
        }
    }

    Rectangle{
        id: heartText
        color: Material.background
        x: window.width/4 - width/2
        y: 60
        width: 100
        height: 50
        Text{
        color: Material.foreground
        anchors.centerIn: parent
        text: "Heart: " + heart.stringHeart  + " "
        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            source: "/icons/heart.png"
        }
        }

    }


    Rectangle{
        color: Material.background
        x: 3*window.width/4 - width/2
        y: 60
        width: 100
        height: 50
        Text{
        color: Material.foreground
        anchors.centerIn: parent
        text: "Calories: " + stats.stringCalories + " "
        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            source: "/icons/calories.png"
        }
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
