import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Task_for_Login_Page")

    Rectangle {
        anchors.fill: parent
        color: "white"
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            TextField {
                id: usernameField
                placeholderText: "Username"
                width: parent.width * 0.8
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                width: parent.width * 0.8
                echoMode: TextInput.Password
            }

            RowLayout {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: loginButton
                    text: "Log In"
                    width: 90
                    onClicked: {
                        console.log("Log In clicked")
                    }
                }

                Button {
                    id: clearButton
                    text: "Clear"
                    width: 90
                    onClicked: {
                        usernameField.text = ""; // Очистка поля Username
                        passwordField.text = ""; // Очистка поля Password
                        console.log("Fields cleared"); // Проверка очищения поля
                    }
                }
            }
        }
    }
}
