import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Weather App")

    property string apiKey: "d6843ab8ee963f5d372296dfff62aed7"
    property string city: "London"
    property string weatherUrl: "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey + "&units=metric"
    property var weatherModel: ListModel {}

    function updateWeather() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", weatherUrl);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status >= 200 && xhr.status < 300) {
                    parseWeatherJson(JSON.parse(xhr.responseText));
                } else {
                    console.error("Error getting weather data, status:", xhr.status);
                   weatherModel.clear();
                    weatherModel.append({text: "Error getting data"});
                }
            }
        };
        xhr.onerror = function() {
            console.error("Error getting weather data.");
              weatherModel.clear();
            weatherModel.append({text: "Error getting data"});
        };
        xhr.send();
    }

    function parseWeatherJson(json) {
        console.log(json)
         if (json && json.name && json.main && json.weather.length > 0) {
            var temperature = json.main.temp.toFixed(1);
            var description = json.weather[0].description
            var humidity = json.main.humidity
            var time = Qt.formatTime(new Date(), "HH:mm")
            var name = json.name
             weatherModel.insert(0, {name:name, temp: temperature, description: description, humidity: humidity, time: time});
         } else {
               weatherModel.insert(0, {text: "Error parsing weather data"});
          }
    }

    Component.onCompleted: {
         updateWeather()
        console.log("weatherListView dimensions: " + weatherListView.width + ", " + weatherListView.height)
     }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#A0C4FF" }
            GradientStop { position: 1.0; color: "white" }
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 8

            ListView {
                spacing: 5
                id: weatherListView
                width: parent.width
                height: parent.height / 2 - 60
                model: weatherModel

                delegate: Item {
                   width: weatherListView.width
                   height: 70
                    Rectangle {
                         Layout.margins: 8
                         Layout.leftMargin: 10
                        width: parent.width
                        height: parent.height
                        color: "#80FFFFFF"
                        radius: 10
                    }
                     ColumnLayout {
                       Layout.fillWidth: true
                        Text {
                            Layout.fillWidth: true
                            text: model.name + ", " + model.time
                            font.bold: true
                         }
                          Text {
                                Layout.fillWidth: true
                                text: "Temperature: " + model.temp + " °C"
                           }
                          Text {
                              Layout.fillWidth: true
                                text: "Description: " + model.description + " (humidity: " + model.humidity + "%)"
                                wrapMode: Text.WordWrap
                            }
                     }
                 }
            }

            Rectangle {
                   id: footer
                   height: 60
                   color: "lightgray"
                   Layout.alignment: Qt.AlignBottom
                 RowLayout {
                       Layout.fillWidth: true
                    spacing: 5
                    TextField {
                          id: cityText
                          Layout.fillWidth: true
                          selectByMouse: true
                          placeholderText: "Enter city..."
                          font.pointSize: 10
                      }
                      Button {
                          id: btnGetWeather
                         Layout.alignment: Qt.AlignRight
                          height: parent.height
                          text: "Get Weather"
                          onClicked: {
                              if (cityText.text.length > 0) {
                                  city = cityText.text
                                 weatherUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey + "&units=metric"
                                 updateWeather();
                                 cityText.clear();
                              }
                          }
                      }
                  }
               }
        }
    }
}
