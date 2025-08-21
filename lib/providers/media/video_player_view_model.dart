import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/services.dart';

class VideoPlayerViewModel extends BaseViewModel {
  final String videoUrl;

  late final CachedVideoPlayerPlusController player;

  bool screenTaped = false;
  bool isFullScreen = false;
  bool isMute = false;
  VideoPlayerViewModel(
    super.context, {
    required this.videoUrl,
  }) {
    initialize();
  }
  @override
  Future<void> dispose() async {
    player.dispose();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Future<void> initialize() async {
    player = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(videoUrl),
      invalidateCacheIfOlderThan: const Duration(minutes: 69),
    );
    await player.initialize();
    player.play();
    update();
  }

  void onTapScreen() {
    screenTaped = !screenTaped;
    update();
  }

  void pause() {
    player.pause();
    update();
  }

  void play() {
    player.play();
    update();
  }

  void setVoume() {
    if (isMute) {
      player.setVolume(1);
    } else {
      player.setVolume(0);
    }
    isMute = !isMute;
    update();
  }

  Future<void> togglefullScreen() async {
    if (!isFullScreen) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      isFullScreen = true;
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      isFullScreen = false;
    }
    onTapScreen();
  }
}
