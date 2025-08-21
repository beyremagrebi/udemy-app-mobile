import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/media/video_player_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'video_player_controls.dart';

class FullScreenVideoViewer extends StatelessWidget {
  final CachedVideoPlayerPlusController player;

  const FullScreenVideoViewer({required this.player, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: player.value.aspectRatio,
          child: CachedVideoPlayerPlus(player),
        ),
      ),
    );
  }
}

class VideoViewer extends StatelessWidget {
  final String videoUrl;
  const VideoViewer({
    required this.videoUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoPlayerViewModel(context, videoUrl: videoUrl),
      child: Consumer<VideoPlayerViewModel>(
        builder: (context, viewModel, child) => AppScaffold(
          backgroundColor: viewModel.isFullScreen ? Colors.black : null,
          appBar: viewModel.isFullScreen ? null : AppBarGradient(),
          body: Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: viewModel.onTapScreen,
                child: AspectRatio(
                  aspectRatio: viewModel.player.value.aspectRatio,
                  child: CachedVideoPlayerPlus(viewModel.player),
                ),
              ),
              if (viewModel.screenTaped ||
                  !viewModel.player.value.isInitialized)
                VideoPlayerControls(
                  viewModel: viewModel,
                )
            ],
          ),
        ),
      ),
    );
  }
}
