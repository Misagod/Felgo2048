import QtQuick 2.0

Rectangle{
    width: gridWidth/2
    height: 50
    radius: 5
    border.width: 5
    border.color: "#7E3D76"
    color: "#F3F3FA"
    Text {
        id: scoreNum
        text: "Score: " + score
        anchors.centerIn: parent
        font.pixelSize: 22
        color: "Black"
    }
}



