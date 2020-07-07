
import QtQuick 2.0

Rectangle{

    id: challengeButton

    property alias text: levelNum.text
    width: 48
    height: width
    color: "#B15BFF"
    radius: 5
    Text {
        id: levelNum
        anchors.centerIn: parent
        font.pixelSize: 16
        color: "white"
    }
    signal clicked

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            challengeButton.clicked()
            audioManager.play(audioManager.idMenuBG)
            challengeButton.scale = 1.0
        }
        onPressed: {
            challengeButton.scale = 0.85
        }
        onReleased: {
            challengeButton.scale = 1.0
        }
        onCanceled: {
            challengeButton.scale = 1.0
        }
     }
}

