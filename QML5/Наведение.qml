import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 480
    height: 640
    visible: true
    title: qsTr("Hello World")
    color: "light grey"

    Rectangle {
        id: btn
        color: mouse.containsMouse ? "red": "orange"
        anchors.centerIn: parent
        width: 200
        height: 100

        MouseArea {
            id:mouse
            hoverEnabled: true
            anchors.fill: btn
        }
    }
}
