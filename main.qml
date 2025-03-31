import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Timer{
        id: timer001
        running: true
        repeat: true
        onTriggered: {
            rectangle001.x = Math.random() * (rectangle001.parent.width - rectangle001.width)
            rectangle001.y = Math.random() * (rectangle001.parent.height - rectangle001.height)
        }
    }

    Text{
        anchors.left: playground.left
        anchors.bottom: playground.top
        text: qsTr("Score: " + rectangle001.clickCount)
    }

    Rectangle{
        id: playground
        anchors.fill: parent
        anchors.margins: 10
        anchors.topMargin: 20
        color: "#EFDD6F"
        clip: true

        Rectangle{
            id: rectangle001

            property int clickCount: 0

            x: 100
            y: 100
            width: 100
            height: 100
            color: "magenta"
            border.color: "black"
            border.width: 3
            radius: 10 //zaobluje rohy
            clip:true

            focus: true
            Keys.onUpPressed: y -= 10
            Keys.onDownPressed: y += 10
            Keys.onLeftPressed: x -= 10
            Keys.onRightPressed: x += 10

            Behavior on x {
                NumberAnimation {
                    duration: timer001.interval
                    easing.type: Easing.OutElastic
                }
            }

            Behavior on y {
                NumberAnimation {
                    duration: timer001.interval
                    easing.type: Easing.OutElastic
                }
            }

            Text{
                anchors.centerIn: parent
                text: parent.clickCount
                //text: qsTr("Klikni na mě!")
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //parent.rotation += 20
                    //rectangle001.x = Math.random() * (rectangle001.parent.width - rectangle001.width)
                    //rectangle001.y = Math.random() * (rectangle001.parent.height - rectangle001.height)
                    rectangle001.clickCount++
                    timer001.interval -= 50
                }
            }
        }

    }
}
