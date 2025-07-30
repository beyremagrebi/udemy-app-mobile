import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/statics_grid.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/main/home/dashboard/actions/action_card.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../interfaces/language/i_screen_with_localization.dart';
import '../class/classes_view.dart';

class ActionsView extends IScreenWithLocalization {
  const ActionsView({super.key});

  @override
  Widget buildLocalized(
    BuildContext context,
    LanguageViewModel languageViewModel,
  ) {
    return StatisticsGrid(
      aspectRatio: 1.5,
      children: [
        ActionCard(
          title: intl.my_classes,
          subTitle: intl.access_classes_groups,
          icon: Symbols.people_outline_rounded,
          iconColor: Colors.redAccent,
          onTap: () => navigateTo(
            context,
            const ClassesView(),
          ),
        ),
        ActionCard(
          title: intl.schedule,
          subTitle: intl.view_timetable,
          icon: Icons.calendar_today_outlined,
          iconColor: Colors.blueAccent,
        ),
        ActionCard(
          title: intl.my_courses,
          subTitle: intl.access_educational_content,
          icon: Symbols.book_5_rounded,
          iconColor: Colors.green,
        ),
        ActionCard(
          title: intl.messaging,
          subTitle: intl.chats_discussions,
          icon: Symbols.chat_info_rounded,
          iconColor: Colors.purpleAccent,
          notifCount: 4,
        )
      ],
      screenWidth: Dimensions.screenWidth,
    );
  }
}
