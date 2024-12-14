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

 Rectangle{
 id:rect_anim
 width:50; height:50
 border.color:"black"; border.width:1;
 color:"yellow"
 x:10; y:10
 }

 PropertyAnimation{
 id:anim
 target:rect_anim; property: "x";from:10; to: 240
 duration: 4000
 running:true }
 }
}
