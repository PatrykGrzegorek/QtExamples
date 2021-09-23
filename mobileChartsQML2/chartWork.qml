import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

Item {
    width: 370
    height: 250
    x: window.width/2 - width/2
    y: window.height/2 - height/2
    ChartView {
         id: chart_view

         title: "Stacked Bar series"
         anchors.fill: parent
         legend.alignment: Qt.AlignBottom
         legend.visible: false
         antialiasing: true
         backgroundColor: "#05071b"
        // animationOptions: ChartView.AllAnimations

         StackedBarSeries {
             barWidth: 1

             axisX: ValueAxis {
                 lineVisible: false
                 gridVisible: false
                 minorGridVisible: false
                 visible: false
                 max: listCount()
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
                 values: getListGreen()
             }
             BarSet {
                 label: "Red"
                 color: "#df1730"
                 borderWidth: 0
                 values: getListRed()
             }
     }}

    function listCount(){
        if(listValues.count > 3)
            return 3;
        return listValues.count
    }

    function getListGreen(){
        var listGreen = new Array(4);
        if(listValues.count < 4)
            return listValues.variantListValuesGreen;
        for (var i = 0; i < 4; i++){
            listGreen[i] = listValues.variantListValuesGreen[i+listValues.count-4];
        }
        return listGreen;
    }

    function getListRed(){
        var listRed = new Array(4);
        if(listValues.count < 4)
            return listValues.variantListValuesRed;
        for (var i = 0; i < 4; i++){
            listRed[i] = listValues.variantListValuesRed[i+listValues.count-4];
        }
        return listRed;
    }
}
