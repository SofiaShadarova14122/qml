import QtQuick 2.15
import QtQuick.Window 2.15
Window {
 width: 640
 height: 480
 visible: true
 title: qsTr("Hello World")

 minimumWidth: 400
 minimumHeight: 450

 Rectangle{
 id:rect
 width:300; height:400
 anchors.centerIn:parent
 color:"lightgrey"

 Rectangle {
  id: myRect
  width: 100
  height: 100
  color: "red"

  ColorAnimation {
  id: colorAnim
  target: myRect
  property: "color"
  to: "blue"
  duration: 1000
  }

  MouseArea {
  anchors.fill: parent
  onClicked: colorAnim.start()
  }
 }
 }
}
