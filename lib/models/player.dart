// ignore_for_file: avoid_print
import 'package:audioplayers/audioplayers.dart';

class Player {
  static AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  static int mstate() {
    return audioPlayer.state.index;
  }

  static void play(String url) async {
    int result = await audioPlayer.play(url);
    result == 1 ? print('playing') : print('error');
  }

  static void pause() async {
    int result = await audioPlayer.pause();
    result == 1 ? print('paused') : print('error');
  }

  static void resume() async {
    int result = await audioPlayer.resume();
    result == 1 ? print('resumed') : print('error');
  }
}
