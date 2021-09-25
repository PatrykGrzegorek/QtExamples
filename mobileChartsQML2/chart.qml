import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

Item {
    ChartView {
         id: chart_view

         title: "Stacked Bar series"
         width: 370
         height: 250
         x: window.width/2 - width/2
         y: window.height/2 - height/2
         legend.alignment: Qt.AlignBottom
         legend.visible: false
         antialiasing: true
         backgroundColor: "#05071b"
        animationOptions: ChartView.AllAnimations

         StackedBarSeries {
             barWidth: 1

             axisX: ValueAxis {
                 lineVisible: false
                 gridVisible: false
                 minorGridVisible: false
                 visible: false
                 max: listValues.count
             }
             axisY: ValueAxis {
                 lineVisible: false
                 gridVisible: false
                 minorGridVisible: false
                 labelsVisible: true
                 labelsColor: "white"
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
     }}
}
