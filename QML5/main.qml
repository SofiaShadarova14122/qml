import QtQuick 2.15
import QtQuick.Window 2.15
Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: rect
        width: 288
        height: 568
        anchors.centerIn: parent
        color: "PowderBlue"

        Rectangle {
            id: rect_red
            width: 120
            height: 120
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: rect_yellow.top
            color: "Crimson"
            border.color: "#550611"
            border.width: 3
            radius: 4
            anchors.bottomMargin: 10
        }

        Rectangle {
            id: rect_yellow
            width: 120
            height: 120
            anchors.centerIn: parent
            color: "Gold"
            border.color: "#b98609"
            border.width: 3
            radius: 4
        }

        Rectangle {
            id: rect_green
            width: 120
            height: 120
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rect_yellow.bottom
            color: "LimeGreen"
            border.color: "#1f5d09"
            border.width: 3
            radius: 4
            anchors.topMargin: 10
        }

        states: [
            State {
                name: "stop"
                PropertyChanges { target: rect_red; color: "Crimson" }
                PropertyChanges { target: rect_yellow; color: "#b98609" }
                PropertyChanges { target: rect_green; color: "#1f5d09" }
            },
            State {
                name: "caution"
                PropertyChanges { target: rect_red; color: "#550611" }
                PropertyChanges { target: rect_yellow; color: "Gold" }
                PropertyChanges { target: rect_green; color: "#1f5d09" }
            },
            State {
                name: "go"
                PropertyChanges { target: rect_red; color: "#550611" }
                PropertyChanges { target: rect_yellow; color: "#b98609" }
                PropertyChanges { target: rect_green; color: "LimeGreen" }
            }
        ]

        state: "stop"

        MouseArea{
            anchors.fill:parent
            onClicked: {
                if (parent.state == "stop") {
                    parent.state = "caution";
                } else if (parent.state == "caution") {
                    parent.state = "go";
                } else {
                    parent.state = "stop";
                }
            }
        }

        transitions:[
            Transition {
                from: "stop"
                to: "caution"
                ColorAnimation {
                    target: rect_red
                    properties: "color"
                    duration: 500
                }
                ColorAnimation {
                    target: rect_yellow
                    properties: "color"
                    duration: 500
                }
            },
            Transition {
                from: "caution"
                to: "go"
                ColorAnimation {
                    target: rect_yellow
                    properties: "color"
                    duration: 500
                }
                ColorAnimation {
                    target: rect_green
                    properties: "color"
                    duration: 500
                }
            },
            Transition {
                from: "go"
                to: "stop"
                ColorAnimation {
                    target: rect_green
                    properties: "color"
                    duration: 500
                }
                ColorAnimation {
                    target: rect_red
                    properties: "color"
                    duration: 500
                }
            }
        ]
    }
}
