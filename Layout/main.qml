import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Task_for_layout")
    id: win
//    property int myMargin: 10

    ColumnLayout {
        id: cl
        spacing: 2
        anchors.fill: parent

        Rectangle {
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                color: "Silver"
                Text {
                    anchors.centerIn: parent
                    text: 'Header'
                }
            }

        Rectangle {
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 10
                color: "white"
                border.color: "Gainsboro"
                border.width: 2
                radius: 4
                Text {
                    anchors.centerIn: parent
                    text: 'Content'
                }
            }

        RowLayout {
            id: rl
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
            Layout.preferredHeight: 70
            spacing: 3

            Rectangle {
                color: 'Silver'
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                Text {
                    anchors.centerIn: parent
                    text: '1'
                }
            }

            Rectangle {
                color: 'Silver'
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                Text {
                    anchors.centerIn: parent
                    text: '2'
                }
            }
            Rectangle {
                color: 'Silver'
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                Text {
                    anchors.centerIn: parent
                    text: '3'
                }
            }
        }
    }
}
