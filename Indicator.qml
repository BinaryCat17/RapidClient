import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    id: root
    property string text: ""
    property string header: ""

    Column {
        spacing: 10
        Pane {
            Material.elevation: 6
            width: root.width
            height: root.height / 2

            ToolButton {
                id: button
                Material.elevation: 6
                width: parent.width
                height: parent.height
                text: root.header
                font.capitalization: Font.Capitalize
                onClicked: {
                    if (text === root.header) {
                        text = root.header + "\nMannualy control"
                        txt.readOnly = false
                    } else {
                        text = root.header
                        txt.readOnly = true
                        txt.text = root.text
                    }
                }

                font.pixelSize: Math.min(pane.width, pane.height) / 6
            }
        }

        Pane {
            id: pane
            Material.elevation: 2

            width: root.width / 2
            height: root.height / 3
            x: button.x + button.width / 2 - width / 2

            TextField {
                id: txt
                anchors.centerIn: parent
                text: root.text
                readOnly: true
                font.pixelSize: Math.min(pane.width, pane.height) / 6
            }
        }
    }
}
