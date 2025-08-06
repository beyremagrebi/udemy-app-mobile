import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/shimmer/notification_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main/profile/theme/theme_view_model.dart';
import '../../widgets/common/app_filtre_chip.dart';
import '../../widgets/global/notification_card.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThemeViewModel>();
    return ChangeNotifierProvider(
      create: NotificationViewModel.new,
      child: Consumer<NotificationViewModel>(
        builder: (context, notifcationViewModel, child) => AppScaffold(
          appBar: AppBarGradient(
            title: const Text('Notifications'),
          ),
          body: Column(
            children: [
              GradientAppBarWidget(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Scrollbar(
                    child: Padding(
                      padding: Dimensions.horizontalPaddingMedium,
                      child: Row(
                        children: [
                          AppFilterChip(
                            viewModel: viewModel,
                            label: 'toutes (6)',
                            selected: false,
                            onTap: () {},
                          ),
                          AppFilterChip(
                            viewModel: viewModel,
                            label: 'Non lues (6)',
                            selected: false,
                            onTap: () {},
                          ),
                          AppFilterChip(
                            viewModel: viewModel,
                            label: 'Messages (6)',
                            selected: false,
                            onTap: () {},
                          ),
                          AppFilterChip(
                            viewModel: viewModel,
                            label: 'Cours (6)',
                            onTap: () {},
                            selected: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AsyncModelListBuilder(
                  viewModel: notifcationViewModel,
                  models: notifcationViewModel.notifications,
                  shimmer: NotificationCardShimmer(),
                  builder: (notifications) => ListView.separated(
                    padding: Dimensions.paddingAllMedium,
                    itemBuilder: (context, index) =>
                        NotificationCard(notification: notifications[index]),
                    separatorBuilder: (context, index) =>
                        Dimensions.heightSmall,
                    itemCount: notifications.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
