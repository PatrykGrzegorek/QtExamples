import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: window
    width: 350
    height: 600
    visible: true
    title: qsTr("oxyMotion")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        GlobalChart {
        }
        History {
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Training")
        }
        TabButton {
            text: qsTr("History")
        }
    }
}
