import QtQuick 2.15
import QtQuick.Controls 2.15

Row {
    id: root
    Repeater {
        id: row
        model: ListModel {
            id: model
            ListElement {
                mheader: "Temperature"
                mtext: "20C"
            }
            ListElement {
                mheader: "Humidity"
                mtext: "30%"
            }
            ListElement {
                mheader: "Light"
                mtext: "10W"
            }
        }

        Indicator {
            width: root.width / 3
            height: root.height
            header: mheader
            text: mtext
        }
    }
}
