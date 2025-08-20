import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/shimmer/notification_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/common/app_filtre_chip.dart';
import '../../widgets/global/notification_card.dart';

class NotificationView extends IScreenWithLocalization {
  const NotificationView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return ChangeNotifierProvider(
      create: NotificationViewModel.new,
      child: Consumer<NotificationViewModel>(
        builder: (context, notifcationViewModel, child) => AppScaffold(
          appBar: AppBarGradient(
            title: Text(intl.notifications),
          ),
          body: Column(
            children: [
              GradientAppBarWidget(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: Dimensions.horizontalPaddingMedium,
                    child: Row(
                      children: [
                        AppFilterChip(
                          label: '${intl.all} (6)',
                          selected: false,
                          onTap: () {},
                        ),
                        AppFilterChip(
                          label: '${intl.unread} (6)',
                          selected: false,
                          onTap: () {},
                        ),
                        AppFilterChip(
                          label: '${intl.messages} (6)',
                          selected: false,
                          onTap: () {},
                        ),
                        AppFilterChip(
                          label: '${intl.courses} (6)',
                          onTap: () {},
                          selected: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AsyncModelListBuilder(
                  onRefresh: notifcationViewModel.loadNotifications,
                  viewModel: notifcationViewModel,
                  models: notifcationViewModel.notifications,
                  shimmer: NotificationCardShimmer(),
                  builder: (notifications) => ListView.separated(
                    padding: Dimensions.paddingAllMedium,
                    itemBuilder: (context, index) => NotificationCard(
                      notificationViewModel: notifcationViewModel,
                      notification: notifications[index],
                    ),
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
