import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/statics_grid.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../interfaces/language/i_screen_with_localization.dart';
import '../../../../../providers/main/profile/language/language_view_model.dart';
import '../../../../../widgets/main/home/dashboard/statistcs/info_card.dart';

class StatisticsView extends IScreenWithLocalization {
  const StatisticsView({super.key});

  @override
  Widget buildLocalized(
    BuildContext context,
    LanguageViewModel languageViewModel,
  ) {
    return StatisticsGrid(
      children: [
        InfoCard(
          title: intl.courses_this_week,
          value: '5',
          icon: Icons.book_outlined,
          iconBackgroundColor: const Color(0xFF3B82F6),
        ),
        InfoCard(
          title: intl.unread_messages,
          value: '4',
          icon: Symbols.chat_info_rounded,
          iconBackgroundColor: const Color(0xFF10B981),
        ),
        InfoCard(
          title: intl.assignments_due,
          value: '2',
          icon: Icons.timer_outlined,
          iconBackgroundColor: const Color(0xFFF59E0B),
        ),
        InfoCard(
          title: intl.overall_average,
          value: '3/28',
          icon: Icons.moving,
          iconBackgroundColor: const Color.fromARGB(255, 225, 2, 255),
        ),
      ],
      screenWidth: Dimensions.screenWidth,
    );
  }
}
