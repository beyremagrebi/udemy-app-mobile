import 'package:erudaxis/presentation/main/home/dashboard/actions/actions_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/event/evenements_prochains_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/invoice/factures_en_attende.dart';
import 'package:erudaxis/presentation/main/home/dashboard/journal/suivi_journal_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/library/recent_libraty_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/next_session/next_session_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/rang/votre_rang_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/statistics/statistics_view.dart';
import 'package:erudaxis/presentation/utils/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../core/styles/dimensions.dart';
import '../../../widgets/common/widgets.dart';
import 'dashboard/quizz/quiz_a_faire_view.dart';
import 'main_header_view.dart';

class HomeView extends StatelessWidget {
  final ScrollController scrollController;
  const HomeView({required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gradientAppBarWidget(const MainHeaderView()),
        Expanded(
          child: ListView(
            controller: scrollController,
            padding: Dimensions.paddingAllMedium,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatisticsView(),
                  Dimensions.heightMedium,
                  TitleWidget(
                    title: 'Actions Rapides',
                    icon: Symbols.electric_bolt_rounded,
                    child: ActionsView(),
                  ),
                  Dimensions.heightMedium,
                  TitleWidget(
                    icon: Symbols.newsstand,
                    title: 'Bibliothèque Récente',
                    child: RecentLibratyView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    icon: Symbols.timer,
                    title: 'Prochaines Séances',
                    child: NextSessionView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: 'Quiz à Faire',
                    icon: Symbols.checklist_rounded,
                    child: QuizAFaireView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: 'Factures en Attente',
                    icon: Icons.paid_outlined,
                    child: FacturesEnAttenteView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: 'Événements Prochains',
                    icon: Symbols.event_available_rounded,
                    child: EvenementsProchainsView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: 'Suivi Journalier',
                    icon: Symbols.person_check_rounded,
                    child: SuiviJournalierView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                      title: 'Votre Rang',
                      icon: Symbols.license_rounded,
                      child: VotreRangView()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
