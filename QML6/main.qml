import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Навигация по стеку страниц"

    Rectangle { // Хедер
        id: header
        height: 60
        color: "lightgray"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        RowLayout {
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            Button {
                text: "<" // Кнопка "назад"
                onClicked: {
                   if (stackView.depth > 1)
                         stackView.pop()
                }
            }
             Text {
                id: headerText
                text:  stackView.currentItem ? stackView.currentItem.title : ""
                anchors.leftMargin: 10
                font.bold: true
                font.pointSize: 14
            }
        }
    }

    StackView {
        id: stackView
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom


        // Страница красного цвета
        Component {
            id: redPage
            Item {
                width: parent.width
                height: parent.height
                property string title: "Red Page" // Title для хедера
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
                        color: "#b98609" // Приглушенный желтый
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
                        color: "#1f5d09" // Приглушенный зеленый
                        border.color: "#1f5d09"
                        border.width: 3
                        radius: 4
                        anchors.topMargin: 10
                    }
                }
                RowLayout {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Button {
                        text: "Go to Green"
                        onClicked: {
                            navigateToPage("greenPage")
                        }
                    }
                    Button {
                        text: "Go to Yellow"
                        onClicked: {
                            navigateToPage("yellowPage")
                        }
                    }
                }
            }
        }

        // Страница зеленого цвета
        Component {
            id: greenPage
            Item {
                width: parent.width
                height: parent.height
                property string title: "Green Page" // Title для хедера
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
                        color: "#b98609"
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
                        color: "LimeGreen"  // Приглушенный зеленый
                        border.color: "#1f5d09"
                        border.width: 3
                        radius: 4
                        anchors.topMargin: 10
                    }
                }
                RowLayout {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Button {
                        text: "Go to Red"
                        onClicked: {
                            navigateToPage("redPage")
                        }
                    }
                    Button {
                        text: "Go to Yellow"
                        onClicked: {
                            navigateToPage("yellowPage")
                        }
                    }
                }
            }
        }


        // Страница желтого цвета
        Component {
            id: yellowPage
            Item {
                width: parent.width
                height: parent.height
                property string title: "Yellow Page" // Title для хедера
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
                        color: "#550611"  // Приглушенный красный
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
                        color: "Gold"
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
                        color: "#1f5d09"
                        border.color: "#1f5d09"
                        border.width: 3
                        radius: 4
                        anchors.topMargin: 10
                    }
                }
                 RowLayout {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Button {
                        text: "Go to Red"
                        onClicked: {
                           navigateToPage("redPage")
                        }
                    }
                    Button {
                        text: "Go to Green"
                        onClicked: {
                           navigateToPage("greenPage")
                        }
                    }
                }
            }
        }
    }

    function navigateToPage(pageId) {
        var pageComponent;
        if (pageId === "redPage")
            pageComponent = redPage;
        else if (pageId === "greenPage")
            pageComponent = greenPage;
        else if (pageId === "yellowPage")
            pageComponent = yellowPage;
        else
           return;

        var pageExists = false;
        for (var i = 0; i < stackView.depth; i++) {
            if (stackView.get(i).__component === pageComponent) {
                pageExists = true;
                break;
            }
        }

        if (pageExists) {
            stackView.replace(pageComponent);
        } else {
            stackView.push(pageComponent);
        }
    }

    Component.onCompleted: {
       stackView.push(redPage) // Начальная страница
   }
}
