import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.XmlListModel 2.15

Item {
    id: root
    width: 300
    height: 480
    property int spacing: 10

    function newXml(s) {
        imageModel.xml = s
    }

    Component {
        id: imageDelegate
        Column {
            Image {
                width: but.width
                height: root.height * 3 / 4
                fillMode: Image.PreserveAspectCrop
                source: image
            }

            Button {
                id: but
                width: root.width / 3 - spacing * 3
                height: root.height / 4
                text: "Plant : " + title + "\n Grows " + rate + " days"
            }
        }
    }

    XmlListModel {
        id: imageModel

        query: "/rss/channel/item"

        onXmlChanged: {
            reload()
        }

        XmlRole {
            name: "title"
            query: "title/string()"
            isKey: true
        }
        XmlRole {
            name: "rate"
            query: "rate/string()"
        }
        XmlRole {
            name: "image"
            query: "image/string()"
        }
    }

    Button {
        id: but
        width: root.width
        height: 300
        x: 200
        text: imageModel.status
    }

    ListView {
        id: listView
        spacing: root.spacing
        orientation: ListView.Horizontal
        anchors.fill: parent
        model: imageModel
        delegate: imageDelegate
    }
}
