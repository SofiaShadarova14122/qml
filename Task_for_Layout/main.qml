import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12

Window {
    width: 480
    height: 800
    visible: true
    title: qsTr("Task_for_layout")
    id: win
    property int myMargin: 10

    ColumnLayout{
        id: cl
        spacing: myMargin
        anchors.fill: parent

        Rectangle {
            id: rect_head
            height: win.height/10
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
            color: "Silver"

            Text {
                id: head_text
                anchors.centerIn: parent
                font.pixelSize: 18
                text: qsTr("Header")
            }
        }

        Rectangle {
            id: rect_center
            color: "white"
            border.color: "Gainsboro"
            border.width: 2
            radius: 4
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
            anchors.top: rect_head.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10
            Text {
                id: center_text
                anchors.centerIn: parent
                font.pixelSize: 18
                text: qsTr("Content")
            }
        }

        RowLayout {
            id: rl
            spacing: myMargin - 7
            anchors.fill: parent
            Layout.alignment: Qt.AlignBottom
            Rectangle {
                id:rect_bord1
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "Silver"
                Layout.alignment: Qt.AlignLeft
                anchors.bottom: parent.bottom

                Text {
                    id: bord1_text
                    anchors.centerIn: parent
                    font.pixelSize: 18
                    text: qsTr("1")
                }
            }

            Rectangle {
                id:rect_bord2
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "Silver"
                Layout.alignment: Qt.AlignCenter
                anchors.bottom: parent.bottom
                Text {
                    id: bord2_text
                    anchors.centerIn: parent
                    font.pixelSize: 18
                    text: qsTr("2")
                }
            }

            Rectangle {
                id:rect_bord3
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "Silver"
                anchors.bottom: parent.bottom
                Layout.alignment: Qt.AlignRight
                Text {
                    id: bord3_text
                    anchors.centerIn: parent
                    font.pixelSize: 18
                    text: qsTr("3")
                }
            }
        }

    }
}
