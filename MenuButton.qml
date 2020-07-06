import QtQuick 2.0
import Felgo 3.0

Rectangle {
    id: button

    // width & height must get set from outside, these are the default values!
    width: 170
    height: 60

    color: "#7E3D76"

    anchors.horizontalCenter: parent.horizontalCenter

    property alias text: buttonText.text
    property alias textColor: buttonText.color
    property alias textSize: buttonText.font.pixelSize
    property alias textItem: buttonText
    property alias font: buttonText.font

    radius: 10

    signal clicked

    Text {
        id: buttonText
        anchors.centerIn: parent
        font.pixelSize: 22
        color: "white"

    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            button.clicked()
            audioManager.play(audioManager.idMenuBG)
            button.scale = 1.0
        }
        onPressed: {
            button.scale = 0.85
        }
        onReleased: {
            button.scale = 1.0
        }
        onCanceled: {
            button.scale = 1.0
        }
    }

}
