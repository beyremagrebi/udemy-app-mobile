import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/statics_grid.dart';
import 'package:erudaxis/widgets/main/home/dashboard/actions/action_card.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

class ActionsView extends StatelessWidget {
  const ActionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return StatisticsGrid(
      aspectRatio: 1.5,
      children: const [
        ActionCard(
          title: 'Mes Classes',
          subTitle: 'Accéder à vos classes et groupes',
          icon: Symbols.people_outline_rounded,
          iconColor: Colors.redAccent,
        ),
        ActionCard(
          title: 'Emploi du temps',
          subTitle: 'Consulter votre planning',
          icon: Icons.calendar_today_outlined,
          iconColor: Colors.blueAccent,
        ),
        ActionCard(
          title: 'Mes Cours',
          subTitle: 'Accéder aux contenus pédagogiques',
          icon: Symbols.book_5_rounded,
          iconColor: Colors.green,
        ),
        ActionCard(
          title: 'Messagerie',
          subTitle: 'Chats et discussions',
          icon: Symbols.chat_info_rounded,
          iconColor: Colors.purpleAccent,
          notifCount: 4,
        )
      ],
      screenWidth: Dimensions.screenWidth,
    );
  }
}
