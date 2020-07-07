import QtQuick 2.0

Column{

    property alias menu: menu
    property alias newPage: newPage
    //give some options including return to the menu and reset the game to players
    spacing: 5
    height: 50
    y: 3

    MenuButton{
        id: menu
        width: 170 * 0.6
        height: 60 * 0.3
        text: "Menu"
        font.pixelSize: 14
        radius: 5
    }
    MenuButton{
        id: newPage
        width: 170 * 0.6
        height: 60 * 0.3
        text: "New"
        font.pixelSize: 14
        radius: 5
    }

}
