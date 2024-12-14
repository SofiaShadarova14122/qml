import QtQuick 2.15
import QtQuick.Window 2.15
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("MouseArea_Signals")

    Rectangle {
        id:btn
        color: "orange"
        anchors.centerIn: parent
        width:200
        height:100

        MouseArea {
            id:mouse
            hoverEnabled: true
            anchors.fill: btn
            onPressed: {btn.width+=20;btn.height+=20; btn.color="darkred"}
            onReleased: {btn.width-=20; btn.height-=20; btn.color="red"}
            onEntered: btn.color="red"
            onExited: btn.color="orange"
        }
    }
}
