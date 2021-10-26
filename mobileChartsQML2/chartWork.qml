import QtQuick 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3
import QtQuick.Controls.Material 2.12

Item {
    ChartView {
         id: chart_view
         titleColor: Material.foreground
         backgroundColor: Material.background
         title: "Training "
         width: 370
         height: 250
         x: window.width/2 - width/2
         y: window.height/2 - height/2
         legend.alignment: Qt.AlignBottom
         legend.visible: false
         antialiasing: true
        animationOptions: ChartView.AllAnimations

         StackedBarSeries {
             barWidth: 1

             axisX: ValueAxis {
                 lineVisible: false
                 gridVisible: false
                 minorGridVisible: false
                 visible: false
                 min: listCount()
                 max: listValues.count
             }

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
                 id: chart_barset_green
                 label: "Green"
                 color: "#28d16f"
                 borderWidth: 0
                 values: []
             }
             BarSet {
                 id: chart_barset_red
                 label: "Red"
                 color: "#df1730"
                 borderWidth: 0
                 values: []
             }
     }
    }

    function listCount(){
        if(listValues.count !== 0)
            update();
        if(listValues.count > 200)
            return listValues.count-200;
        return 0

    }

    function update(){

        var p =listValues.listValues[listValues.count-1]
        //console.log("updated with: " + p)
        if (p > 54) {
            chart_barset_red.append(0)
            chart_barset_green.append(p)
        } else {
            chart_barset_red.append(p)
            chart_barset_green.append(0)
        }
    }
}
