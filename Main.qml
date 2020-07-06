import Felgo 3.0
import QtQuick 2.0

GameWindow {
    id: window
    property var previousScene: "main"


    screenWidth: 640
    screenHeight: 960

    AudioManager{
        id:audioManager
    }
    MainScene{
        id: mainScene
        opacity: 0
    }
    GameScene{
        id: gameScene
        opacity: 0

    }
    EndlessMode{
        id: endlessMode
        opacity: 0
    }

    GameOverScene{
        id: gameOverScene
        opacity: 0
    }
    WinnerScene{
        id: winnerScene
        opacity: 0
    }
    ScoreScene{
        id: scoreScene
        opacity: 0
    }
    LevelChoiceScene{
        id: levelChoiceScene
        opacity: 0
    }
    ChallengeMode{
        id: challengeMode
        opacity: 0
    }
    ChallengeComplete{
        id: challengeComplete
        opacity: 0
    }
    Lightningmode{
        id: lightningMode
        opacity: 0
    }
    SizeChoiceScene{
        id: sizeChoiceScene
        opacity: 0
    }
    Mode3x3{
        id: mode3x3
        opacity: 0
    }
    Mode5x5{
        id: mode5x5
        opacity: 0
    }
    Nightmaremode{
        id: mode8x8
        opacity: 0
    }




    state: "main"

    states: [
        State {
            name: "main"
            PropertyChanges {
                target: mainScene
                opacity: 1
            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: gameScene
                opacity: 1
            }
        },
        State {
            name: "gameover"
            PropertyChanges {
                target: gameOverScene
                opacity: 1
            }
        },
        State {
            name: "win"
            PropertyChanges {
                target: winnerScene
                opacity: 1
            }
        },
        State {
            name: "endlessmode"
            PropertyChanges {
                target: endlessMode
                opacity: 1
            }
        },
        State {
            name: "scorePage"
            PropertyChanges {
                target: scoreScene
                opacity: 1
            }
        },
        State {
            name: "levelChoice"
            PropertyChanges {
                target: levelChoiceScene
                opacity: 1
            }
        },
        State {
            name: "challengemode"
            PropertyChanges {
                target: challengeMode
                opacity: 1
            }
        },
        State {
            name: "challengecomplete"
            PropertyChanges {
                target: challengeComplete
                opacity: 1
            }
        },
        State {
            name: "lightningmode"
            PropertyChanges {
                target: lightningMode
                opacity: 1
            }
        },
        State {
            name: "sizechoice"
            PropertyChanges {
                target: sizeChoiceScene
                opacity: 1
            }
        },
        State {
            name: "mode3x3"
            PropertyChanges {
                target: mode3x3
                opacity: 1
            }
        },
        State {
            name: "mode5x5"
            PropertyChanges {
                target: mode5x5
                opacity: 1
            }
        },
        State {
            name: "nightmare"
            PropertyChanges {
                target: mode8x8
                opacity: 1
            }
        }

    ]
    onStateChanged: {
        if(state === "main") activeScene = mainScene
        else if(state === "game") activeScene = gameScene
        else if(state === "gameover") activeScene = gameOverScene
        else if(state === "win") activeScene = winnerScene
        else if(state === "endlessmode") activeScene = endlessMode
        else if(state === "scorePage") activeScene = scoreScene
        else if(state === "levelChoice") activeScene = levelChoiceScene
        else if(state === "challengemode") activeScene = challengeMode
        else if(state === "challengecomplete") activeScene = challengeComplete
        else if(state === "lightningmode") {
            activeScene = lightningMode
            lightningMode.isRunning = 1
        }
        else if(state === "sizechoice") activeScene = sizeChoiceScene
        else if(state === "mode3x3") activeScene = mode3x3
        else if(state === "mode5x5") activeScene = mode5x5
        else if(state === "nightmare") activeScene = mode8x8

    }


}
