import QtQuick 2.0

SceneBase{

    id: challengeComplete

    BackgroundPage{}
    Column{
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        Text {
            text: "You win!!!!"
            color: "#D3A4FF"
            font.pixelSize: 48
        }
        Item{
            height: 40
            width: 10
        }
        MenuButton{
            id: nextLevel
            text: "Next"
            onClicked: {

                if(challengeMode.presentTask+1 !== 10)
                {
                    challengeMode.setTask(challengeMode.presentTask+1)
                    window.state = "challengemode"
                }
            }
        }

        MenuButton{
            id: restart
            text: "Restart"
            onClicked: {
//                gameScene.newGame()
                window.state = "challengemode"
                challengeMode.setTask(challengeMode.presentTask)
            }
        }
//        MenuButton{
//            id: continueGame
//            text: "Continue"
//            onClicked: {
//                window.state = "game"
//            }
//        }

        MenuButton{
            id: toMenu
            text: "Back to Menu"
            onClicked: {
                window.state = "main"
            }
        }
    }
}
