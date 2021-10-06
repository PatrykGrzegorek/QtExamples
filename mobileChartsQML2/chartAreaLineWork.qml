import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

Item {
    ChartView {
        id: chart_line
        title: "Some some"
        width: 370
        height: 250
        x: window.width/2 - width/2
        y: window.height/2 - height/2
        legend.alignment: Qt.AlignBottom
        legend.visible: false
        antialiasing: true
        backgroundColor: "#05071b"
       animationOptions: ChartView.SeriesAnimations

        // Define x-axis to be used with the series instead of default one
        ValueAxis {
            id: valueAxisX
            min: listCount()
            max: listValues.count
            tickCount: 0
            labelFormat: "%.0f"
        }

        ValueAxis {
            id: valueAxisY
            min: 50
            max: 60
            labelFormat: "%.0f"
        }

        AreaSeries {
            name: "Green"
            axisX: valueAxisX
            axisY: valueAxisY
            borderWidth: 0
            pointLabelsClipping  : true
            upperSeries: LineSeries {
                id: chart_line_green
            }
        }
        AreaSeries {
            name: "Red"
            axisX: valueAxisX
            axisY: valueAxisY
            borderWidth: 0
            pointLabelsClipping  : true
            color: "#df1730"
            upperSeries: LineSeries {
                id: chart_line_red
            }
        }
    }
    function listCount(){
        if(listValues.count !== 0)
            update();
        if(listValues.count > 30)
            return listValues.count-30;
        return 0

    }

    function update(){
        var p =listValues.listValues[listValues.count-1]
        console.log("updated with: " + p)
        if (p > 54) {
            chart_line_red.append(listValues.count, 50)
            chart_line_green.append(listValues.count, p)
        } else {
            chart_line_red.append(listValues.count, p)
            chart_line_green.append(listValues.count, 50)
        }
    }
}
