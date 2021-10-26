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
        ScrollBar.horizontal.policy: ScrollBar.AsNeeded
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
                  max: {
                      if(listValues.count<180)
                          return listValues.count
                      return 180
                  }
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
                     label: "Blue"
                     color: "#08FDF1"
                     borderWidth: 0
                     values: valueListFinishChart()
                 }
         }
         LineSeries{
             axisX: timeAxis
         }

         MouseArea{
             anchors.fill: parent
             onDoubleClicked: {
                 if(xAxis.max * 1.5 <= listValues.count){
                    buttonResetZoom.visible = true
                    xAxis.max = xAxis.max * 1.5
                    scroll_chart.contentWidth = scroll_chart.contentWidth * 1.5
                    chart_view.width = chart_view.width * 1.5
                    timeAxis.tickCount = timeAxis.tickCount * 1.5
                    if(xAxis.max > listValues.count)
                        xAxis.max = listValues.count
                 }
                 else if(xAxis.max > listValues.count){
                    xAxis.max = listValues.count
                 }
                 else{
                     buttonResetZoom.visible = true
                     xAxis.max = xAxis.max * listValues.count/xAxis.max
                     scroll_chart.contentWidth = scroll_chart.contentWidth * listValues.count/xAxis.max
                     chart_view.width = chart_view.width * listValues.count/xAxis.max
                     timeAxis.tickCount = timeAxis.tickCount * listValues.count/xAxis.max
                     if(xAxis.max > listValues.count)
                         xAxis.max = listValues.count
                 }

             }
         }
        }
    }
    function visibleTimeAxis(){
        if(listValues.count)
            return true
        return false
    }

    function howStrongSmallerAverage(){
        var a = Math.floor(listValues.count/xAxis.max)
        return a;
    }

    function howStrongBiggerAverage(){
        var a = howStrongSmallerAverage() + 1
        return a;
    }

    function howManyBiggerAverage(){
       var a = listValues.count - xAxis.max * howStrongSmallerAverage()
       return a
    }

    function valueListFinishChart(){

        if(xAxis.max>=listValues.count){
            return listValues.variantListValues

        }
        else{
            var finishChart = new Array(xAxis.max);
            var result=0;
            for(var i = 0; i<xAxis.max;i++){
                if(i < howManyBiggerAverage()){

                    for(var j = 0; j<howStrongBiggerAverage();j++){
                        console.log("Linia 157")
                        console.log(i)
                        console.log(j)
                    result += listValues.listValues[i*howStrongBiggerAverage()+j]

                    }
                    finishChart[i] = result/howStrongBiggerAverage();


                    result = 0;
                }
                else{
                    console.log("Linia 165")
                    for(var g = 0; g<howStrongSmallerAverage();g++){
                    if(i+g <= xAxis.max){
                        console.log("###################")
                        console.log(listValues.count)
                        console.log(howManyBiggerAverage())
                        console.log(howStrongBiggerAverage())
                        console.log(i)
                        console.log(howStrongSmallerAverage())
                        console.log(g)
                        console.log(howManyBiggerAverage()*howStrongBiggerAverage())
                        console.log(i*howStrongSmallerAverage())
                        console.log(howManyBiggerAverage()*howStrongBiggerAverage()+(i-howManyBiggerAverage()*howStrongBiggerAverage())*howStrongSmallerAverage()+g)
                        result += listValues.listValues[howManyBiggerAverage()*howStrongBiggerAverage()+(i-howManyBiggerAverage())*howStrongSmallerAverage()+g]}
                    else
                        return finishChart
                    }
                    finishChart[i] = result/howStrongSmallerAverage();
                    result = 0;
                }
        }
        for(var h=0; h<xAxis.max;h++)
            console.log("finishChart "+finishChart[h]+"    "+h)
        return finishChart
        }
    }
    Button{
        id: buttonResetZoom
        visible: false
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: 120
        height: 40
        text: "RESET ZOOM"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                xAxis.max = 180
                scroll_chart.contentWidth = scroll_chart.parent.width
                chart_view.width = chart_view.parent.width
                timeAxis.tickCount = 3
                buttonResetZoom.visible = false
            }
        }
    }
}
