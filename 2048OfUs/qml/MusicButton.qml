import QtQuick 2.0
import Felgo 3.0

MenuButton{
    id:musicButton

  Text{
      id:musicon
      text: "Music On"
      font.pixelSize: 20
      color: "#D3A4FF"
      visible: settings.musicEnabled
      anchors.centerIn: parent
  }

  Text{
      id:musicoff
      text: "Music Off"
      font.pixelSize: 20
      color: "#D3A4FF"
      visible: !settings.musicEnabled
      anchors.centerIn: parent
  }

  MouseArea {
      anchors.fill: parent

      onClicked: {
          musicButton.scale = 1.0
          settings.musicEnabled = !settings.musicEnabled
      }
      onPressed: {
          musicButton.scale = 0.85
      }
      onReleased: {
          musicButton.scale = 1.0
      }
      onCanceled: {
          musicButton.scale = 1.0
      }
   }
  AudioManager{

  }
}
