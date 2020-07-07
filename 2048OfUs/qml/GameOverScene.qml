import QtQuick 2.0

SceneBase{
    BackgroundPage{}
    Column{
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        Text {
            text: "You failed!"
            font.pixelSize: 48
            color:"#D3A4FF"
        }
        Item{
            height: 80
            width: 10
        }

        MenuButton{
            id: restart
            text: "Restart"
            onClicked: {
                if(window.previousScene === "game")
                {
                    gameScene.newGame()
                    window.state = "game"
                }else if(window.previousScene === "challengemode")
                {
                    challengeMode.setTask(challengeMode.presentTask)
                    window.state = "challengemode"
                }
            }
        }
//        MenuButton{
//            id: backToGame
//            text: "Back"
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
