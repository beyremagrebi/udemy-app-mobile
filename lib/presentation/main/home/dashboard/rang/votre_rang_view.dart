import 'package:flutter/material.dart';

import '../../../../../widgets/main/home/dashboard/rang/votre_range_card.dart';

class VotreRangView extends StatelessWidget {
  const VotreRangView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example values, could come from props / state / API later
    const rank = 3;
    const total = 28;
    const positionText = 'Position en classe';
    const trendIcon = Icons.arrow_upward_rounded;
    const trendColor = Colors.greenAccent;

    return const VotreRangCard(
      rank: rank,
      total: total,
      positionText: positionText,
      trendIcon: trendIcon,
      trendColor: trendColor,
    );
  }
}
