import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/presentation/utils/spin_loading.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:erudaxis/providers/media/video_player_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/global/user.dart';
import '../../styles/dimensions.dart';

class VideoPlayerControls extends StatelessWidget {
  final VideoPlayerViewModel viewModel;
  final User? owenerVideo;
  const VideoPlayerControls(
      {required this.viewModel, this.owenerVideo, super.key});

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
              Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      ApiImageWidget(
                        imageFileName: owenerVideo?.image,
                        hasImageView: true,
                        imageNetworUrl:
                            '$baseURl/enterprise-${FacilityManager.facility.enterprise?.id}/images',
                        isMen: owenerVideo?.isMen,
                        borderRadius: Dimensions.smallBorderRadius,
                        height: 32,
                        width: 32,
                      ),
                      Dimensions.widthSmall,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${owenerVideo?.firstName} ${owenerVideo?.lastName}',
                              style: textTheme.labelSmall,
                            ),
                            Text(
                              '${owenerVideo?.role?.localizedName()}',
                              style: textTheme.labelSmall
                                  ?.copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: viewModel.setVoume,
                        icon: Icon(viewModel.isMute
                            ? Icons.volume_off_outlined
                            : Icons.volume_up_outlined),
                      ),
                    ],
                  )),
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
                              final duration = value.duration;
                              final position = value.position;

                              if (!value.isInitialized) {
                                return const SizedBox();
                              }

                              String formatDuration(Duration d) {
                                String twoDigits(int n) =>
                                    n.toString().padLeft(2, '0');
                                final hours = d.inHours;
                                final minutes = d.inMinutes.remainder(60);
                                final seconds = d.inSeconds.remainder(60);
                                if (hours > 0) {
                                  return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
                                }
                                return '${twoDigits(minutes)}:${twoDigits(seconds)}';
                              }

                              return Row(
                                children: [
                                  Text(
                                    formatDuration(position),
                                    style: textTheme.labelSmall,
                                  ),
                                  Expanded(
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        thumbShape: const RoundSliderThumbShape(
                                          enabledThumbRadius: 6,
                                        ),
                                        overlayShape:
                                            const RoundSliderOverlayShape(
                                          overlayRadius: 12,
                                        ),
                                      ),
                                      child: Slider(
                                        value: position.inMilliseconds
                                            .clamp(0, duration.inMilliseconds)
                                            .toDouble(),
                                        max: duration.inMilliseconds.toDouble(),
                                        activeColor:
                                            themeViewModel.currentTheme.primary,
                                        inactiveColor: themeViewModel
                                            .currentTheme.secondary,
                                        onChanged: (v) {
                                          viewModel.player.seekTo(Duration(
                                              milliseconds: v.toInt()));
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    formatDuration(duration),
                                    style: textTheme.labelSmall,
                                  ),
                                  IconButton(
                                    onPressed: viewModel.togglefullScreen,
                                    icon: const Icon(Icons.fullscreen_outlined),
                                  ),
                                ],
                              );
                            },
                          ),
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
