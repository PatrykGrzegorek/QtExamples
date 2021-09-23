import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

Rectangle {
    width: 640
    height: 500
    visible: true
    property string newName: "someText.text"
    property int newValue: someValue.value
        Rectangle{
            y:10
            width: 640
            height: 30
            color: "lightblue"
            TextInput{
                id: someText
                anchors.fill:parent
                //width: parent
                color: activeFocus ? "black" : "gray"
                font.pixelSize: 20
                activeFocusOnTab: true
                text: "text"
            }
        }
        Rectangle{
            y:50
            width: 640
            height: 30
            color: "lightblue"
            SpinBox{
                id: someValue
                anchors.fill:parent
                from: 0
                to: 100
                stepSize: 1
                value: 18
                font.pixelSize: 20
                activeFocusOnTab: true
            }
        }
        Button{
            width: 50
            height: 50
            y: 100
            MouseArea{
                id: showdb
                anchors.fill: parent
                onClicked: {
                    newName = someText.text
                    newValue= someValue.value
                    console.log("qml start -  ")
                    console.log(newName)
                    console.log(newValue)
                    _db.addUser(newName, newValue)
                    console.log(_db.count())
                    repdb.model = _db.count()
                    loadDatagram.active = !loadDatagram.active
                    loadDatagram.active = !loadDatagram.active
                    console.log("     qml stop   ")
                }
            }
        }


        Column{
            spacing: 10
            y:150
        Repeater{
             id: repdb
             model: _db.count()
             delegate: Rectangle{
                  width: 40;
                  height: 20;
                  Text{
                  anchors.centerIn: parent
                  text: _db.takeName(model.index)+" "+_db.takeValue(model.index)
                  }
              }
        }
        }
        Loader{
            id: loadDatagram
            source: "someComponent.qml"
        }
}
