import QtQuick 2.0

SceneBase{
    property int score: 0

    BackgroundPage{}
    Column{
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        Text {
            text: "You Scored " + score
            font.pixelSize: 40
            color:"#D3A4FF"
        }
        Item{
            height: 20
            width: 10
        }

        MenuButton{
            id: restart
            text: "Restart"
            onClicked: {
                if(window.previousScene === "endlessmode")
                {
                    endlessMode.newGame()
                    window.state = window.previousScene
                }
                else if(window.previousScene === "lightningmode")
                {
                    lightningMode.newGame()
                    lightningMode.isRunning = 1
                    window.state = window.previousScene
                }
                else if(window.previousScene === "mode3x3")
                {
                    mode3x3.newGame()

                    window.state = window.previousScene
                }
                else if(window.previousScene === "mode5x5")
                {
                    mode5x5.newGame()

                    window.state = window.previousScene
                }
                else if(window.previousScene === "nightmare")
                {
                    mode8x8.newGame()

                    window.state = window.previousScene
                }
            }
        }
        MenuButton{
            id: backToGame
            text: "Back"
            onClicked: {
                window.state = "endlessmode"
            }
        }

        MenuButton{
            id: toMenu
            text: "Back to Menu"
            onClicked: {
                endlessMode.newGame()
                window.state = "main"
            }
        }
    }
}
