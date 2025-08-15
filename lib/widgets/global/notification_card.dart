import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../models/global/notification.dart';

class NotificationCard extends IScreenWithLocalization {
  final NotificationViewModel notificationViewModel;
  final NotificationModel notification;
  const NotificationCard(
      {required this.notificationViewModel,
      required this.notification,
      super.key});

  @override
  Widget buildLocalized(
    BuildContext context,
    LanguageViewModel languageViewModel,
  ) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            notificationViewModel.updateNotification(notification);
          },
          child: Container(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const IconBox(
                  icon: Symbols.book_5_rounded,
                  iconBackgroundColor: Colors.green,
                ),
                Dimensions.widthSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title ?? intl.error,
                        style: textTheme.titleSmall,
                      ),
                      Text(
                        notification.body ?? intl.error,
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.white70,
                        ),
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
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    if (notification.unread)
                      Container(
                        height: 4,
                        width: 4,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                      ),
                    Dimensions.widthxSmall,
                    InkWell(
                      onTap: () {
                        notificationViewModel
                            .deleteNotification(notification.id);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
