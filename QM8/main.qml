import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Цветные страницы с Page Indicator"

    SwipeView {
        id: view
        anchors.fill: parent

        Item {
            id: firstPage

            Rectangle {
                id: rect1
                width: 288
                height: 568
                anchors.centerIn: parent
                color: "PowderBlue"

                Rectangle {
                    id: rect_red1
                    width: 120
                    height: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: rect_yellow1.top
                    color: "Crimson"
                    border.color: "#550611"
                    border.width: 3
                    radius: 4
                    anchors.bottomMargin: 10
                }

                Rectangle {
                    id: rect_yellow1
                    width: 120
                    height: 120
                    anchors.centerIn: parent
                    color: "#b98609"
                    border.color: "#b98609"
                    border.width: 3
                    radius: 4
                }

                Rectangle {
                    id: rect_green1
                    width: 120
                    height: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: rect_yellow1.bottom
                    color: "#1f5d09"
                    border.color: "#1f5d09"
                    border.width: 3
                    radius: 4
                    anchors.topMargin: 10
                }
            }
        }


        Item {
            id: secondPage
            Rectangle {
                id: rect2
                width: 288
                height: 568
                anchors.centerIn: parent
                color: "PowderBlue"

                Rectangle {
                    id: rect_red2
                    width: 120
                    height: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: rect_yellow2.top
                    color: "#550611"
                    border.color: "#550611"
                    border.width: 3
                    radius: 4
                    anchors.bottomMargin: 10
                }

                Rectangle {
                    id: rect_yellow2
                    width: 120
                    height: 120
                    anchors.centerIn: parent
                    color: "Gold"
                    border.color: "#b98609"
                    border.width: 3
                    radius: 4
                }

                Rectangle {
                    id: rect_green2
                    width: 120
                    height: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: rect_yellow2.bottom
                    color: "#1f5d09"
                    border.color: "#1f5d09"
                    border.width: 3
                    radius: 4
                    anchors.topMargin: 10
                }
        }
        }

        Item {
            id: thirdPage
            Rectangle {
                id: rect3
                width: 288
                height: 568
                anchors.centerIn: parent
                color: "PowderBlue"

                Rectangle {
                    id: rect_red3
                    width: 120
                    height: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: rect_yellow3.top
                    color: "#550611"
                    border.color: "#550611"
                    border.width: 3
                    radius: 4
                    anchors.bottomMargin: 10
                }

                Rectangle {
                    id: rect_yellow3
                    width: 120
                    height: 120
                    anchors.centerIn: parent
                    color: "#b98609"
                    border.color: "#b98609"
                    border.width: 3
                    radius: 4
                }

                Rectangle {
                    id: rect_green3
                    width: 120
                    height: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: rect_yellow3.bottom
                    color: "LimeGreen"
                    border.color: "#1f5d09"
                    border.width: 3
                    radius: 4
                    anchors.topMargin: 10
                }
            }
        }
    }

    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // Обновление индикатора страниц при изменении currentIndex
    Connections {
        target: view
        onCurrentIndexChanged: {
            indicator.currentIndex = view.currentIndex;
        }
    }
}
