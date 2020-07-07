import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.0

Item {
    id: audioManager

    property int idMusicBG: 111
    property int idMenuBG: 44

    function play(clipID) {
      switch(clipID) {
      case idMenuBG:
        clipMENUCLICK.play()
        break
      }
    }

    function playMusic(trackID) {
      // if settings disable do not play sounds
      if(!settings.musicEnabled)
        return
      switch(trackID) {
      case idMusicBG:
          music.source="../assets/newlife.mp3"
          break
      }
      music.play()
    }

    function stopMusic() {
        music.stop()
    }


    BackgroundMusic{
        id:music
    }

    Audio {
      id: clipMENUCLICK
      source: "../assets/menuclick.wav"
      volume: 1
    }

    Component.onCompleted: {
        playMusic(idMusicBG)

    }
}
