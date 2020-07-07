import QtQuick 2.0
import Felgo 3.0


SceneBase{
    BackgroundPage{
        source: "../assets/9.jpg"
    }

    Column{
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        y: 90

        MenuButton{
            text: "3 X 3"
            onClicked: {window.state = "mode3x3"}
        }
        MenuButton{
            text: "5 X 5"
            onClicked: {window.state = "mode5x5"}
        }
        MenuButton{
            text: "Nightmare Mode"
            onClicked: {window.state = "nightmare"}
        }
        MenuButton{
            text: "Lightning Mode"
            onClicked: {window.state = "lightningmode"}
        }

        MenuButton{
            text: "Back"
            onClicked: {
                window.state = "main"
            }
        }
    }
}
