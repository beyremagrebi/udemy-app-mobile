import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/global/message.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_colors.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageWidget({
    required this.message,
    required this.isMe,
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
            child: Text(message.message ?? intl.error,
                style: textTheme.bodyMedium),
          ),
        ),
      );
    }
  }
}
