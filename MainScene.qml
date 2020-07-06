
import QtQuick 2.0
import Felgo 3.0

SceneBase{
    id: mainScene
    property bool exitDialogShown: false
    onBackButtonPressed: {
        exitDialogShown = true
        // instead of immediately shutting down the app, ask the user if he really wants to exit the app with a native dialog
        nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2);
    }
    Connections {
        // nativeUtils should only be connected, when this is the active scene
        target: activeScene === mainScene ? nativeUtils : null
        onMessageBoxFinished: {
//            console.debug("the user confirmed the Ok/Cancel dialog with:", accepted)
            if(accepted && exitDialogShown) {
                Qt.quit()
            }


            // set it to false again
            exitDialogShown = false
        }
    }//solve the problem of exit game.

    BackgroundPage{
//        anchors.fill: parent
    }
    Column{
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0
        MenuText{
            text: "2048"
            font.pixelSize: 75
            anchors.bottomMargin: -10
        }

        MenuButton{
            text: "Classic Mode"
            onClicked: {

                window.state = "game"
            }
        }
        MenuButton{
            text: "Endless Mode"
            onClicked: {

                window.state = "endlessmode"
            }
        }
        MenuButton{
            text: "Challenge"
            onClicked: {

                window.state = "levelChoice"
            }
        }
        MenuButton{
            text: "More"
            onClicked: {

                window.state = "sizechoice"
            }
        }
        MusicButton{}
    }
}

