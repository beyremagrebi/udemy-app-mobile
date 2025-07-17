import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/main/home/dashboard/actions/actions_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/event/evenements_prochains_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/invoice/factures_en_attende.dart';
import 'package:erudaxis/presentation/main/home/dashboard/journal/suivi_journal_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/library/recent_libraty_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/next_session/next_session_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/rang/votre_rang_view.dart';
import 'package:erudaxis/presentation/main/home/dashboard/statistics/statistics_view.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/title_widget.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../core/styles/dimensions.dart';
import 'dashboard/quizz/quiz_a_faire_view.dart';
import 'main_header_view.dart';

class HomeView extends IScreenWithLocalization {
  const HomeView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Column(
      children: [
        const GradientAppBarWidget(
          child: MainHeaderView(),
        ),
        Expanded(
          child: ListView(
            controller: homeScrollController,
            padding: Dimensions.paddingAllMedium,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StatisticsView(),
                  Dimensions.heightMedium,
                  TitleWidget(
                    title: intl.quickActions,
                    icon: Symbols.electric_bolt_rounded,
                    child: const ActionsView(),
                  ),
                  Dimensions.heightMedium,
                  TitleWidget(
                    icon: Symbols.newsstand,
                    title: intl.recentLibrary,
                    child: const RecentLibratyView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    icon: Symbols.timer,
                    title: intl.upcomingSessions,
                    onTap: () {},
                    materialPage: AppScaffold(
                      appBar: AppBarGradient(),
                    ),
                    child: const NextSessionView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: intl.quizzesToDo,
                    icon: Symbols.checklist_rounded,
                    onTap: () {},
                    materialPage: AppScaffold(
                      appBar: AppBarGradient(),
                    ),
                    child: const QuizAFaireView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: intl.pendingInvoices,
                    icon: Icons.paid_outlined,
                    onTap: () {},
                    materialPage: AppScaffold(
                      appBar: AppBarGradient(),
                    ),
                    child: const FacturesEnAttenteView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: intl.upcomingEvents,
                    icon: Symbols.event_available_rounded,
                    onTap: () {},
                    materialPage: AppScaffold(
                      appBar: AppBarGradient(),
                    ),
                    child: const EvenementsProchainsView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: intl.dailyTracking,
                    icon: Symbols.person_check_rounded,
                    onTap: () {},
                    materialPage: AppScaffold(
                      appBar: AppBarGradient(),
                    ),
                    child: const SuiviJournalierView(),
                  ),
                  Dimensions.heightExtraLarge,
                  TitleWidget(
                    title: intl.yourRank,
                    icon: Symbols.license_rounded,
                    child: const VotreRangView(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
