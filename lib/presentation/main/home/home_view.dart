import 'package:flutter/material.dart';

import '../../../core/styles/dimensions.dart';
import '../../../widgets/common/widgets.dart';
import '../../../widgets/main/home/action_card.dart';
import '../../../widgets/main/home/info_card.dart';
import '../../../widgets/main/home/main_header_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          gradientAppBarWidget(const MainHeaderWidget()),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                Padding(
                  padding: EdgeInsets.all(Dimensions.l),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DashboardGrid(),
                      SizedBox(height: Dimensions.xl),
                      _QuickActions(),
                      _QuickActions(),
                      _QuickActions(),
                      _QuickActions(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardGrid extends StatelessWidget {
  const _DashboardGrid();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InfoCard(
                title: 'Cours cette semaine',
                value: '12',
                icon: Icons.book_outlined,
                iconBackgroundColor: Color(0xFF3B82F6),
              ),
            ),
            SizedBox(width: Dimensions.l),
            Expanded(
              child: InfoCard(
                title: 'Messages non lus',
                value: '4',
                icon: Icons.chat_bubble_outline,
                iconBackgroundColor: Color(0xFF10B981),
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.l),
        Row(
          children: [
            Expanded(
              child: InfoCard(
                title: 'Devoirs à rendre',
                value: '3',
                icon: Icons.access_time,
                iconBackgroundColor: Color(0xFFF59E0B),
              ),
            ),
            SizedBox(width: Dimensions.l),
            Expanded(
              child: InfoCard(
                title: 'Moyenne générale',
                value: '3/28',
                icon: Icons.trending_up,
                iconBackgroundColor: Color(0xFF8A3FFC),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '⚡ Actions Rapides',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Dimensions.l),
        const Row(
          children: [
            Expanded(
              child: ActionCard(
                title: 'Mes Classes',
                subtitle: 'Accéder à vos classes et groupes',
                icon: Icons.people,
                iconColor: Colors.redAccent,
              ),
            ),
            SizedBox(width: Dimensions.l),
            Expanded(
              child: ActionCard(
                title: 'Emploi du temps',
                subtitle: 'Consulter votre planning',
                icon: Icons.calendar_today,
                iconColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.l),
        const Row(
          children: [
            Expanded(
              child: ActionCard(
                title: 'Mes Cours',
                subtitle: 'Accéder aux contenus pédagogiques',
                icon: Icons.book_rounded,
                iconColor: Colors.green,
              ),
            ),
            SizedBox(width: Dimensions.l),
            Expanded(
              child: ActionCard(
                title: 'Messagerie',
                subtitle: 'Chats et discussions',
                icon: Icons.chat_bubble,
                iconColor: Colors.purpleAccent,
                notificationCount: 4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
