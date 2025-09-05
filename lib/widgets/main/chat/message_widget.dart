import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/global/message.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/media/api_image_widget.dart';
import '../../../core/constants/env.dart';
import '../../../core/styles/app_colors.dart';
import '../../../presentation/utils/session/facility_manager.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isMe;
  final bool showAvatar;
  final bool isGroup;

  const MessageWidget({
    required this.message,
    required this.isMe,
    required this.isGroup,
    this.showAvatar = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeViewModel viewModel = context.watch<ThemeViewModel>();

    if (isMe) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: Dimensions.paddingAllMedium,
          constraints: const BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            gradient: LinearGradient(
              colors: viewModel.currentTheme == ThemeApp.defaultTheme
                  ? [
                      AppColors.surfaceGradientEnd,
                      const Color.fromARGB(255, 41, 72, 248),
                      const Color.fromARGB(255, 41, 72, 248),
                    ]
                  : viewModel.currentTheme == ThemeApp.charcoal
                      ? [
                          const Color.fromARGB(255, 41, 72, 248),
                          const Color.fromARGB(255, 41, 72, 248),
                        ]
                      : [
                          viewModel.currentTheme.primary,
                          viewModel.currentTheme.secondary,
                        ],
            ),
          ),
          child: Text(
            message.message ?? intl.error,
            style: textTheme.bodyMedium,
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (showAvatar) ...[
              ApiImageWidget(
                imageFileName: message.author?.image,
                imageNetworUrl:
                    '$baseURl/enterprise-${FacilityManager.facility.enterprise?.id}/images/',
                height: 24,
                width: 24,
                hasImageView: true,
                isMen: message.author?.isMen,
                isProfilePicture: true,
              ),
              Dimensions.heightSmall,
            ] else
              const SizedBox(width: 24),
            Flexible(
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: Dimensions.paddingAllMedium,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showAvatar && isGroup)
                        Text(
                          '${message.author?.firstName} ${message.author?.lastName}',
                          style: textTheme.labelSmall?.copyWith(
                            color:
                                viewModel.currentTheme.primary.withGreen(200),
                          ),
                        ),
                      Text(message.message ?? intl.error,
                          style: textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
