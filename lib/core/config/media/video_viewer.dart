import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/media/video_player_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/global/user.dart';
import 'video_player_controls.dart';

class VideoViewer extends StatelessWidget {
  final String videoUrl;
  final User? owenerVideo;
  const VideoViewer({
    required this.videoUrl,
    this.owenerVideo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoPlayerViewModel(context, videoUrl: videoUrl),
      child: Consumer<VideoPlayerViewModel>(
        builder: (context, viewModel, child) => SafeArea(
          child: AppScaffold(
            backgroundColor: Colors.black,
            body: InkWell(
              onTap: viewModel.onTapScreen,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// Video Player
                  AspectRatio(
                    aspectRatio: viewModel.player.value.aspectRatio,
                    child: CachedVideoPlayerPlus(viewModel.player),
                  ),

                  /// Controls with Fade Animation
                  AnimatedOpacity(
                    opacity: viewModel.screenTaped ||
                            !viewModel.player.value.isInitialized
                        ? 1.0
                        : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: VideoPlayerControls(
                      viewModel: viewModel,
                      owenerVideo: owenerVideo,
                    ),
                  ),

                  /// Close Button with Fade Animation
                  AnimatedOpacity(
                    opacity: viewModel.screenTaped ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: viewModel.closeVideoViewer,
                        icon: const Icon(Icons.close_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
