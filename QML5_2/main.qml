import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Task_for_layout")
    id: win

    property string currentPage: "1"

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
                id: headerText
                anchors.centerIn: parent
                text: 'Header'
            }

            Button {
                text: "←"
                Layout.alignment: Qt.AlignVCenter
                width: 50
                height: parent.height
                onClicked: {
                   if (currentPage === "2") {
                       currentPage = "1";
                       contentText.text = "Добро пожаловать на страницу 1";
                       rl.state = "state1";
                   } else if (currentPage === "3") {
                        currentPage = "2";
                       contentText.text = "Добро пожаловать на страницу 2";
                       rl.state = "state2";
                   }
                }
                visible: currentPage === "2" || currentPage === "3"
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
                id: contentText
                anchors.centerIn: parent
                text: 'Some content'
            }
        }

        RowLayout {
            id: rl
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
            Layout.preferredHeight: 70
            spacing: 3
            Rectangle {
                id: button1
                color: "Silver"
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                Text {
                    anchors.centerIn: parent
                    text: "1"
                    color: "DimGrey"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                         rl.state = "state1";
                         changePage("1", "Item 1 content", "Header 1");
                    }
                }
            }
            Rectangle {
                id: button2
                color: "Silver"
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                Text {
                    anchors.centerIn: parent
                    text: "2"
                    color: "DimGrey"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rl.state = "state2";
                        changePage("2", "Item 2 content", "Header 2");
                    }
                }
            }

            Rectangle {
                id: button3
                color: "Silver"
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                Text {
                    anchors.centerIn: parent
                    text: "3"
                    color: "DimGrey"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rl.state = "state3";
                        changePage("3", "Item 3 content", "Header 3");
                    }
                }
            }

            states: [
                State {
                    name: "state1"
                    PropertyChanges { target: button1; color: "DarkGray" }
                    PropertyChanges { target: button2; color: "Silver" }
                    PropertyChanges { target: button3; color: "Silver" }
                    PropertyChanges { target: button1.children[0]; color: "Black" }
                    PropertyChanges { target: button2.children[0]; color: "DimGrey" }
                    PropertyChanges { target: button3.children[0]; color: "DimGrey" }
                },
                State {
                    name: "state2"
                    PropertyChanges { target: button1; color: "Silver" }
                    PropertyChanges { target: button2; color: "DarkGray" }
                    PropertyChanges { target: button3; color: "Silver" }
                    PropertyChanges { target: button1.children[0]; color: "DimGrey" }
                    PropertyChanges { target: button2.children[0]; color: "Black" }
                    PropertyChanges { target: button3.children[0]; color: "DimGrey" }
                },
                State {
                    name: "state3"
                    PropertyChanges { target: button1; color: "Silver" }
                    PropertyChanges { target: button2; color: "Silver" }
                    PropertyChanges { target: button3; color: "DarkGray" }
                    PropertyChanges { target: button1.children[0]; color: "DimGrey" }
                    PropertyChanges { target: button2.children[0]; color: "DimGrey" }
                    PropertyChanges { target: button3.children[0]; color: "Black" }
                }
            ]

            state: "state1"

            transitions:[
                Transition {
                    from: "state1"
                    to: "state2"
                    ColorAnimation {
                        target: button1
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button1.children[0]
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button2
                        properties: "color"
                        duration: 500
                    }
                     ColorAnimation {
                       target: button2.children[0]
                        properties: "color"
                        duration: 500
                    }
                },

                Transition {
                    from: "state1"
                    to: "state3"
                     ColorAnimation {
                        target: button1
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button1.children[0]
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button3
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button3.children[0]
                        properties: "color"
                        duration: 500
                    }
                },

                Transition {
                    from: "state2"
                    to: "state1"
                     ColorAnimation {
                        target: button1
                        properties: "color"
                        duration: 500
                    }
                     ColorAnimation {
                       target: button1.children[0]
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button2
                        properties: "color"
                        duration: 500
                    }
                     ColorAnimation {
                        target: button2.children[0]
                        properties: "color"
                        duration: 500
                    }
                },

                Transition {
                    from: "state2"
                    to: "state3"
                     ColorAnimation {
                        target: button3
                        properties: "color"
                        duration: 500
                    }
                     ColorAnimation {
                       target: button3.children[0]
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button2
                        properties: "color"
                        duration: 500
                    }
                     ColorAnimation {
                        target: button2.children[0]
                        properties: "color"
                        duration: 500
                    }
                },

                Transition {
                    from: "state3"
                    to: "state1"
                    ColorAnimation {
                        target: button1
                        properties: "color"
                        duration: 500
                    }
                     ColorAnimation {
                         target: button1.children[0]
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button3
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                         target: button3.children[0]
                        properties: "color"
                        duration: 500
                    }
                },

                Transition {
                    from: "state3"
                    to: "state2"
                     ColorAnimation {
                        target: button3
                        properties: "color"
                        duration: 500
                    }
                     ColorAnimation {
                        target: button3.children[0]
                        properties: "color"
                        duration: 500
                    }
                    ColorAnimation {
                        target: button2
                        properties: "color"
                        duration: 500
                    }
                     ColorAnimation {
                        target: button2.children[0]
                        properties: "color"
                        duration: 500
                    }
                }
            ]
        }
    }

    function changePage(page, content, header) {
        contentText.text = content;
        headerText.text = header;
        currentPage = page;
    }

     Component.onCompleted: {
          if (currentPage === "1") {
              contentText.text = "Добро пожаловать на страницу 1";
              rl.state = "state1"
          } else if (currentPage === "2") {
              contentText.text = "Добро пожаловать на страницу 2";
               rl.state = "state2"
          } else if (currentPage === "3") {
               contentText.text = "Добро пожаловать на страницу 3";
               rl.state = "state3"
          }
      }
}
