import QtQuick 2.15
import QtQuick.Controls 2.12
import QtWebSockets 1.1

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    //property string address: "localhost:9003"
    property string address: "5.167.50.115:9003"
    property string websocket: "ws://" + address
    property string server: "http://" + address

    title: qsTr("Hello World")

    Column {
        x: 20
        y: 20
        Indicators {
            width: mainWindow.width
            height: mainWindow.height / 2 - 20
        }
        Configurations {
            id: conf
            width: mainWindow.width
            height: mainWindow.height / 2 - 20
        }
    }

    WebSocket {
        id: socket
        url: websocket
        active: true
        onTextMessageReceived: function (s) {
            if (s.startsWith("xml")) {
                conf.newXml(s.slice(4))
            }
        }
        onStatusChanged: {
            if (socket.status == WebSocket.Error) {
                console.log("Error: " + socket.errorString)
            } else if (socket.status == WebSocket.Open) {
                socket.sendTextMessage("get xml")
            } else if (socket.status == WebSocket.Closed) {

            }
        }
    }
}
