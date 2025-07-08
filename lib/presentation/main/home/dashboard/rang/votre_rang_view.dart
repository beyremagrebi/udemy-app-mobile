import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/main/home/dashboard/rang/votre_range_card.dart';

class VotreRangView extends IScreenWithLocalization {
  const VotreRangView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    const rank = 3;
    const total = 28;
    final positionText = intl.class_position;
    const trendIcon = Icons.arrow_upward_rounded;
    const trendColor = Colors.greenAccent;

    return VotreRangCard(
      rank: rank,
      total: total,
      positionText: positionText,
      trendIcon: trendIcon,
      trendColor: trendColor,
    );
  }
}
