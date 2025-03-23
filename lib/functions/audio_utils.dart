import 'package:audioplayers/audioplayers.dart';

class AudioUtils {
  static AudioCache? _bgAudioCache;
  static AudioPlayer? _bgAudioPlayer;

  static AudioCache? getBGAudioCache() {
    if (_bgAudioCache == null)
      return _bgAudioCache = AudioCache();
    else
      return _bgAudioCache;
  }

  static void playBgMusic() async {
    if (_bgAudioPlayer == null) {
      _bgAudioPlayer = AudioPlayer();

      _bgAudioPlayer?.setReleaseMode(ReleaseMode.loop);
      await _bgAudioPlayer?.play(AssetSource('audio/bg_music.mp3'));
    } else
      _resumeBgMusic();
  }

  static void pauseBgMusic() {
    _bgAudioPlayer?.pause();
  }

  static void _resumeBgMusic() {
    _bgAudioPlayer?.resume();
  }

  static disposeBGMusic() {
    _bgAudioPlayer?.dispose();
  }

  static bool isBGMusicPlaying() {
    return _bgAudioPlayer?.state == PlayerState.playing;
  }
}
