import QtQuick 2.0

Row{

    width: 280
    id: task

    property int task1: 0
    property int task1finished: 0
    property int task1unfinished: 0

    property int task2: 0
    property int task2finished: 0
    property int task2unfinished: 0

    property int task3: 0
    property int task3finished: 0
    property int task3unfinished: 0

    property int leftSteps: 0

    //    Text {
    //        text: "Steps" + " : " + leftSteps
    //    }
    Rectangle{
        width: gridWidth/2
        height: 50
        radius: 5
        border.width: 5
        border.color: "#7E3D76"
        color: "#F3F3FA"
        //anchors.left: gameContainer.anchors.left
        Text {
            text: "Steps: " + leftSteps
            anchors.centerIn: parent
            font.pixelSize: 22
            color: "black"
        }
    }
    Column{
        spacing: 3
        height: 50
        width: 140
        Rectangle{
//            anchors.centerIn: parent
            width: 170*0.6
            height: 60*0.3
            border.width: 3
            border.color: "#7E3D76"
            color: "#F3F3FA"
            radius: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text{
                anchors.centerIn: parent
                font.pixelSize: 14
                color: "black"
                text: task1 + " : " + task1finished + " / " + task1unfinished
            }
        }
        Rectangle{
            width: 170*0.6
            height: 60*0.3
            border.width: 3
            border.color: "#7E3D76"
            color: "#F3F3FA"
            radius: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text{
                anchors.centerIn: parent
                font.pixelSize: 14
                color: "black"
                text: task2 + " : " + task2finished + " / " + task2unfinished
            }
        }
        Rectangle{
            width: 170*0.6
            height: 60*0.3
            border.width: 3
            border.color: "#7E3D76"
            color: "#F3F3FA"
            radius: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text{
                anchors.centerIn: parent
                font.pixelSize: 14
                color: "black"
                text: task3 + " : " + task3finished + " / " + task3unfinished
            }
        }



    }

}
