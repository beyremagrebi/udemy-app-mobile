import 'package:erudaxis/presentation/utils/spin_loading.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:erudaxis/providers/media/video_player_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../styles/dimensions.dart';

class VideoPlayerControls extends StatelessWidget {
  final VideoPlayerViewModel viewModel;
  const VideoPlayerControls({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return AspectRatio(
      aspectRatio: viewModel.player.value.aspectRatio,
      child: InkWell(
        onTap: viewModel.onTapScreen,
        child: Container(
          color: Colors.black.withOpacity(0.6),
          padding: Dimensions.paddingAllMedium,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // --- Main Play/Pause/Skip Buttons ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (viewModel.player.value.isInitialized)
                    IconButton(
                      onPressed: () {
                        final currentPos = viewModel.player.value.position;
                        viewModel.player.seekTo(
                          currentPos - const Duration(seconds: 10),
                        );
                      },
                      icon: const Icon(Icons.replay_10_rounded),
                    ),
                  if (!viewModel.player.value.isInitialized)
                    const SpinLoading(),
                  if (viewModel.player.value.isInitialized)
                    IconButton(
                      onPressed: () {
                        if (viewModel.player.value.isPlaying) {
                          viewModel.pause();
                        } else {
                          viewModel.play();
                        }
                      },
                      icon: Icon(
                        viewModel.player.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow_rounded,
                      ),
                    ),
                  if (viewModel.player.value.isInitialized)
                    IconButton(
                      onPressed: () {
                        final currentPos = viewModel.player.value.position;
                        viewModel.player.seekTo(
                          currentPos + const Duration(seconds: 10),
                        );
                      },
                      icon: const Icon(Icons.forward_10_rounded),
                    ),
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: viewModel.player,
                            builder: (context, value, child) {
                              final duration = value.duration.inMilliseconds;
                              final position = value.position.inMilliseconds;

                              if (duration <= 0) {
                                return const SizedBox();
                              }

                              return SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 6,
                                  ),
                                  overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 12,
                                  ),
                                ),
                                child: Slider(
                                  value: position.clamp(0, duration).toDouble(),
                                  max: duration.toDouble(),
                                  activeColor:
                                      themeViewModel.currentTheme.primary,
                                  inactiveColor:
                                      themeViewModel.currentTheme.secondary,
                                  onChanged: (v) {
                                    viewModel.player.seekTo(
                                        Duration(milliseconds: v.toInt()));
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: viewModel.togglefullScreen,
                          icon: const Icon(Icons.fullscreen_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
