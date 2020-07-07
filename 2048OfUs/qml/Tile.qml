
import Felgo 3.0
import QtQuick 2.2

EntityBase{
    id: tile
    entityType: "Tile"

    width: gridWidth / gridSizeGame
    height: width // square so height=width

    property int tileIndex // is responsible for a position of the tile
    property int tileValue // tileValue is what gets incremented everytime 2 tiles get merged
    property color tileColor
    property color tileTextColor: "black"
    property string tileText

    // tileFontSize is deduced from the tile width, therefore it will always fit into the tile(up to 10^5)
    property int tileFontSize: width/2

    // animationDuration is responsible for how long an animation will go
    // 360ms for desktop and 250ms for mobiles
    property int animationDuration: system.desktopPlatform ? 360 : 250

    // tileColor corresponds to the tileValue
    property var bgColors: ["#000000", "#B8B8DC", "#9999CC", "#8080C0", "#7373B9", "#5A5AAD", "#5151A2", "#484891", "#8F4586", "#7E3D76", "#6C3365", "#613030"]

    // tile rectangle
    Rectangle {
        id: innerRect
        anchors.centerIn: parent // center this object in the invisible "EntityBase"
        width: parent.width-6 // -6 is the width offset, set it to 0 is no offset is needed
        height: width // square so height=width
        radius: 1.5 // radius of tile corners
        color: bgColors[tileValue]

        // tile text
        Text {
            id: innerRectText
            anchors.centerIn: parent // center this object in the "innerRect"
            color: tileTextColor
            font.pixelSize: tileFontSize
            text: Math.pow(2, tileValue) // tileValue gets squared according to the 2048 rules (1,2,3) ->(2,4,6)
        }
    }

    // startup position calculation
    Component.onCompleted: {
        x = (width) * (tileIndex % gridSizeGame) // we get the current row and multiply with the width to get the current position
        y = (height) * Math.floor(tileIndex/gridSizeGame) // we get the current column and multiply with the width to get the current position
        tileValue = Math.random() < 0.9 ? 1 : 2 // a new tile has 10% = 4 and 90% = 2
        showTileAnim.start() // new tile animation trigger
    }

    //this methods gets called everytime a tile moves
    // it has exactly the same kind of behaviour as our privious bethod
    // however, the values get transfered to a targetPoint to simplify our movement animations
    function moveTile(newTileIndex) {
        tileIndex = newTileIndex
        moveTileAnim.targetPoint.x = ((width) * (tileIndex % gridSizeGame))
        moveTileAnim.targetPoint.y = ((height) * Math.floor(tileIndex/gridSizeGame))
        moveTileAnim.start()
    }

    function destroyTile() { // trigger tile death animation
        deathAnimation.start()
    }

    function mergeTile() {
        mergeAnimation.start()
        console.log("asdaada\n")
    }

    // in a parallel animation, animations which are inside will run at the same time
    ParallelAnimation {
        id: showTileAnim

        // number animation works with any real number
        NumberAnimation {
            target: innerRect // specify the target of the animation
            property: "opacity" // specify the property that will be animated
            from: 0
            to: 1
            duration: animationDuration
        }

        // ScaleAnimator used for scaling
        ScaleAnimator {
            target: innerRect
            from:0.5
            to: 1
            duration: animationDuration/0.65
            easing.type: Easing.OutQuad // Easing used to put some live action in your animation
        }
    }

    // movement animation
    ParallelAnimation {
        id: moveTileAnim
        property point targetPoint: Qt.point(0,0)
        NumberAnimation {
            target: tile
            property: "x"
            duration: animationDuration/1.5
            to: moveTileAnim.targetPoint.x
        }
        NumberAnimation {
            target: tile
            property: "y"
            duration: animationDuration/1.5
            to: moveTileAnim.targetPoint.y
        }
    }

    SequentialAnimation{
        id: mergeAnimation

        ScaleAnimator {
            target: innerRect
            from:1
            to: 1.2
            duration: animationDuration/1.7
            easing.type: Easing.InOutQuad // Easing used to put some live action in your animation
        }

        ScaleAnimator {
            target: innerRect
            from:1.2
            to: 1
            duration: animationDuration/1.7
            easing.type: Easing.InOutQuad // Easing used to put some live action in your animation
        }
    }

    // a ScriptAction is treated like an animation, so the SequentialAnimation will call this script after the previous animation has finished
    // in other words, when the tile is completely faded out, it will be removed
    SequentialAnimation {
        id: deathAnimation

        ScaleAnimator {
            target: innerRect
            from:1
            to: 0
            duration: animationDuration/3
            easing.type: Easing.OutQuad // Easing used to put some live action in your animation
        }
        NumberAnimation {
            target: innerRect
            property: "opacity"
            from: 1
            to: 0
            duration: animationDuration/100
        }
        ScriptAction {
            script: removeEntity() // removesEntity from the game
        }
    }
}

