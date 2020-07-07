import QtQuick 2.0


SceneBase{
    BackgroundPage{
        source: "../assets/7.jpg"
    }

    Text {
        id: headerText
        text: "Levels"
        color: "#D3A4FF"
        font.pixelSize: 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 70
    }

    Grid{
        anchors.centerIn: parent
        spacing: 5
        columns: 5
        Repeater{
            model: 10
            delegate: ChallengeButton{
                property int level : index + 1
                text: level
                onClicked: {
                    challengeMode.setTask(index)
                    window.state = "challengemode"
                    console.log("pressed\n")
                }
            }
        }
    }
    MenuButton{
        text: "Back"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        onClicked: {
            window.state = "main"
        }
    }
}
