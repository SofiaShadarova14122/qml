import QtQuick 2.15
import QtQuick.Window 2.15
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
                color: (currentPage === "1") ? "#A8A8A8" : "#E1E1E1"
                Layout.fillWidth: true
                Layout.preferredHeight: 70

                Text {
                    anchors.centerIn: parent
                    text: "1"
                    color: (currentPage === "1") ? "black" : "grey";
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: changePage("1", "Item 1 content", "Header 1");
                }
            }

            Rectangle {
                id: button2
                color: (currentPage === "2") ? "#A8A8A8" : "#E1E1E1"
                Layout.fillWidth: true
                Layout.preferredHeight: 70

                Text {
                    anchors.centerIn: parent
                    text: "2"
                    color: (currentPage === "2") ? "black" : "grey";
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: changePage("2", "Item 2 content", "Header 2");
                }
            }
            Rectangle {
                id: button3
                color: (currentPage === "3") ? "#A8A8A8" : "#E1E1E1"
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                Text {
                    anchors.centerIn: parent
                    text: "3"
                    color: (currentPage === "3") ? "black" : "grey";
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: changePage("3", "Item 3 content", "Header 3");
                }
            }
        }
    }
    function changePage(page, content, header) {
        contentText.text = content;
        headerText.text = header;
        currentPage = page;

        button1.children[0].color = (currentPage === "1") ? "black" : "grey";
        button2.children[0].color = (currentPage === "2") ? "black" : "grey";
        button3.children[0].color = (currentPage === "3") ? "black" : "grey";
    }
}
