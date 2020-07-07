import QtQuick 2.0

SceneBase{
    BackgroundPage{}
    Column{
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        Text {
            text: "You win!!!!"
            font.pixelSize: 48
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
                gameScene.newGame()
                window.state = "game"
            }
        }


        MenuButton{
            id: toMenu
            text: "Back to Menu"
            onClicked: {
                window.state = "main"
            }
        }
    }
}

