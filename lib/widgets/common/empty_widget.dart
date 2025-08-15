import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/common/gradient_button.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends IScreenWithLocalization {
  final String? title;
  final String? message;
  final IconData? icon;

  final Future<void> Function()? onRefresh;

  const EmptyWidget({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.onRefresh,
  });

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Center(
      child: Padding(
        padding: Dimensions.paddingAllExtraLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              size: 64,
              color: Colors.white70,
            ),
            Dimensions.heightSmall,
            Text(
              title ?? intl.no_data_available,
              style: textTheme.titleLarge?.copyWith(
                color: Colors.white38,
              ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              Dimensions.heightSmall,
              Text(
                message!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white38),
                textAlign: TextAlign.center,
              ),
            ],
            if (onRefresh != null) ...[
              Dimensions.heightMedium,
              GradientButton(
                text: intl.refresh,
                onPressed: onRefresh,
              )
            ]
          ],
        ),
      ),
    );
  }
}
