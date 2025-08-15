import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/models/global/notification.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/providers/main/home/class/activity_recent_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/shimmer/activity_recent_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../utils/colors_generator.dart';
import '../../../../utils/icon_box.dart';
import '../../../../utils/limited_list_view.dart';
import '../../../../utils/title_widget.dart';

class ActivityRecentView extends IScreenWithLocalization {
  const ActivityRecentView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return TitleWidget(
      child: ChangeNotifierProvider(
        create: ActivityRecentViewModel.new,
        child: Consumer<ActivityRecentViewModel>(
          builder: (context, viewModel, child) => AsyncModelListBuilder(
            viewModel: viewModel,
            onRefresh: viewModel.loadActivityRecent,
            shimmer: SizedBox(
                height: 55 * 3 + (Dimensions.s * 2),
                child: ActivityRecentCardShimmer()),
            models: viewModel.recentActivities,
            builder: (activityRecents) => LimitedListView(
              separator: Dimensions.heightSmall,
              children: List.generate(
                activityRecents.length,
                (index) => _buildActivityRecent(
                    notification: activityRecents[index],
                    languageViewModel: languageViewModel),
              ),
              itemHeight: 55,
              separatorHeight: Dimensions.s,
            ),
          ),
        ),
      ),
      title: intl.recent_activity,
      onTap: () {},
      materialPage: Container(),
      icon: Icons.assignment_outlined,
    );
  }

  Widget _buildActivityRecent(
      {required NotificationModel notification,
      required LanguageViewModel languageViewModel}) {
    return Card(
      elevation: 0,
      child: Container(
        width: double.maxFinite,
        height: 55,
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            IconBox(
              icon: getCourseIconFromName(notification.type ?? intl.error),
              iconBackgroundColor: Colors.green,
              size: 32,
            ),
            Dimensions.widthSmall,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title ?? intl.error,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    notification.createdAt != null
                        ? timeago.format(
                            notification.createdAt is DateTime
                                ? notification.createdAt!
                                : DateTime.parse(
                                    notification.createdAt.toString()),
                            locale: languageViewModel.locale.toString(),
                          )
                        : intl.error,
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.white38,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
