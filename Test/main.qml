import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Pyramid with Transparent Rectangle")

    Item {
        id: root
        anchors.fill: parent

        Rectangle {
            id: rect_top
            width: parent.width * 0.7
            height: parent.height * 0.17
            color: "Indigo"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rect_top2
            width: rect_top.width * 0.75
            height: rect_top.height * 0.8
            color: "DarkBlue"
            anchors.bottom: rect_top.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rect_top3
            width: rect_top2.width * 0.75
            height: rect_top2.height * 0.8
            color: "DeepSkyBlue"
            anchors.bottom: rect_top2.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rect_top4
            width: rect_top3.width * 0.75
            height: rect_top3.height * 0.8
            color: "YellowGreen"
            anchors.bottom: rect_top3.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rect_top5
            width: rect_top4.width * 0.75
            height: rect_top4.height * 0.8
            color: "Gold"
            anchors.bottom: rect_top4.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rect_top6
            width: rect_top5.width * 0.75
            height: rect_top5.height * 0.8
            color: "Orange"
            anchors.bottom: rect_top5.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rect_top7
            width: rect_top6.width * 0.75
            height: rect_top6.height * 0.8
            color: "OrangeRed"
            anchors.bottom: rect_top6.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rect_transparent
            width: 15
            height: 20 + rect_top.height + rect_top2.height + rect_top3.height + rect_top4.height + rect_top5.height + rect_top6.height + rect_top7.height
            color: "Silver"
            opacity: 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }
}
