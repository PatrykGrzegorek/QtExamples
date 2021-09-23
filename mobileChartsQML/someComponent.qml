import QtQuick 2.0
import QtQuick.Controls 2.12
import QtCharts 2.3

Item {
    ChartView {
        width: 640
        height: 300
        y: 200
        title: "Example chart"
        //anchors.fill: parent
        legend.alignment: Qt.AlignBottom
        //antialiasing: true

        BarSeries {
            id: mySeries
            axisX: BarCategoryAxis { categories: _db.takeAllNames() }
            BarSet { values: _db.takeAllValues() }
        }
    }
}
