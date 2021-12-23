import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';

class Player {
  static AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  static void play(String url) async {
    print(url);
    int result = await audioPlayer.play(url);
    if (result == 1) {
      print('playing');
    } else {
      print('error');
    }
  }

  static void pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print('paused');
    } else {
      print('error');
    }
  }

  static void resume() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      print('resumed');
    } else {
      print('error');
    }
  }

  static void stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      print('stopped');
    } else {
      print('error');
    }
  }
}
