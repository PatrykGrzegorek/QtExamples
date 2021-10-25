import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4

Item {
    width: 370
    height: 250
    x: window.width/2 - width/2
    y: window.height/2 - height/2

    ScrollView{
        id: scroll_chart
        anchors.fill: parent
        anchors.centerIn: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
        ScrollBar.horizontal.interactive: true
        contentWidth: parent.width
        ChartView {
             id: chart_view
             titleColor: Material.foreground
             backgroundColor: Material.background
             title: "Pause"
             anchors.fill: parent
//             width: 450
//             height: 250
             anchors.centerIn: parent
             legend.alignment: Qt.AlignBottom
             legend.visible: false
             antialiasing: true
             animationOptions: ChartView.AllAnimations

             DateTimeAxis {
                  id: timeAxis
                  lineVisible: false
                  gridVisible: false
                  minorGridVisible: false
                  visible: visibleTimeAxis()
                  format: "hh:mm:ss"
                  min:{
                         var start = new Date(timeStart.getTime())
                         var hour = 24 + timeStart.getUTCHours() - timeStart.getHours()
                         if (hour == 24)
                             hour = 0
                         start.setHours(hour)
                         start.setMinutes(0)
                         start.setSeconds(0)
                         return start;
                  }
                  max:{
                        var stop = new Date(timeStop.getTime())
                        var hour = 24 + timeStart.getUTCHours() - timeStart.getHours()
                        if (hour == 24)
                            hour = 0
                        stop.setHours(hour)
                        stop.setMinutes(0)
                        stop.setSeconds(0)
                        stop.setSeconds((timeStop.getTime() - timeStart.getTime())/1000)
                        return stop;
                  }
                  tickCount: 3
            }

             ValueAxis {
                  id: xAxis
                  lineVisible: false
                  gridVisible: false
                  minorGridVisible: false
                  visible: false
                  min: 0
                  max: listValues.count-1
              }

             StackedBarSeries {
                 barWidth: 1

                 axisX: xAxis

                 axisY: ValueAxis {
                     lineVisible: false
                     gridVisible: false
                     minorGridVisible: false
                     labelsVisible: true
                     labelsColor: Material.accent
                     visible: true
                     labelFormat: "%d%%"
                     min: 50
                     max: 60
                 }

                 BarSet {
                     label: "Green"
                     color: "#28d16f"
                     borderWidth: 0
                     values: listValues.variantListValuesGreen
                 }
                 BarSet {
                     label: "Red"
                     color: "#df1730"
                     borderWidth: 0
                     values: listValues.variantListValuesRed
                 }
         }
         LineSeries{
             axisX: timeAxis
         }

         MouseArea{
             anchors.fill: parent
             onDoubleClicked: {
                 scroll_chart.contentWidth = scroll_chart.contentWidth * 1.5
                 chart_view.width = chart_view.width * 1.5
                 timeAxis.tickCount = timeAxis.tickCount * 1.5
             }
         }
        }
    }
    function visibleTimeAxis(){
        if(listValues.count)
            return true
        return false
    }
}
