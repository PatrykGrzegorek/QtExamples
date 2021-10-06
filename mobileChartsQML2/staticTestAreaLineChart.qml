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
            tickCount: 0
            labelFormat: "%.0f"
        }

        ValueAxis {
            id: valueAxisY
            min: 0
            max: 10
            labelFormat: "%.0f"
        }

        AreaSeries {
            name: "Green"
            axisX: valueAxisX
            axisY: valueAxisY
            borderWidth: 0
            upperSeries: LineSeries {
                XYPoint { x: 0; y: 9 }
                XYPoint { x: 1; y: 8 }
                XYPoint { x: 2; y: 7 }
                XYPoint { x: 3; y: 9 }
                XYPoint { x: 4; y: 7 }
                XYPoint { x: 5; y: 6 }
                XYPoint { x: 6; y: 5 }
                XYPoint { x: 7; y: 0 }
                XYPoint { x: 8; y: 0 }
                XYPoint { x: 9; y: 0 }
                XYPoint { x: 10; y: 0 }
                XYPoint { x: 11; y: 5 }
                XYPoint { x: 12; y: 6 }
                XYPoint { x: 13; y: 0 }
                XYPoint { x: 14; y: 0 }
                XYPoint { x: 15; y: 0 }
                XYPoint { x: 16; y: 0 }
                XYPoint { x: 17; y: 0 }
                XYPoint { x: 18; y: 5 }
                XYPoint { x: 19; y: 6 }
                XYPoint { x: 20; y: 7 }
                XYPoint { x: 21; y: 8 }
                XYPoint { x: 22; y: 6 }
                XYPoint { x: 23; y: 6 }
                XYPoint { x: 24; y: 5 }
                XYPoint { x: 25; y: 0 }
                XYPoint { x: 26; y: 0 }
                XYPoint { x: 27; y: 0 }
                XYPoint { x: 28; y: 0 }
                XYPoint { x: 29; y: 6 }
            }
        }
        AreaSeries {
            name: "Red"
            axisX: valueAxisX
            axisY: valueAxisY
            borderWidth: 0
            color: "#df1730"
            upperSeries: LineSeries {
                XYPoint { x: 0; y: 0 }
                XYPoint { x: 1; y: 0 }
                XYPoint { x: 2; y: 0 }
                XYPoint { x: 3; y: 0 }
                XYPoint { x: 4; y: 0 }
                XYPoint { x: 5; y: 0 }
                XYPoint { x: 6; y: 0 }
                XYPoint { x: 7; y: 4 }
                XYPoint { x: 8; y: 2 }
                XYPoint { x: 9; y: 3 }
                XYPoint { x: 10; y: 4 }
                XYPoint { x: 11; y: 0 }
                XYPoint { x: 12; y: 0 }
                XYPoint { x: 13; y: 4 }
                XYPoint { x: 14; y: 3 }
                XYPoint { x: 15; y: 2 }
                XYPoint { x: 16; y: 3 }
                XYPoint { x: 17; y: 4 }
                XYPoint { x: 18; y: 0 }
                XYPoint { x: 19; y: 0 }
                XYPoint { x: 20; y: 0 }
                XYPoint { x: 21; y: 0 }
                XYPoint { x: 22; y: 0 }
                XYPoint { x: 23; y: 0 }
                XYPoint { x: 24; y: 0 }
                XYPoint { x: 25; y: 4 }
                XYPoint { x: 26; y: 3 }
                XYPoint { x: 27; y: 3 }
                XYPoint { x: 28; y: 4 }
                XYPoint { x: 29; y: 0 }
            }
        }
    }
}
