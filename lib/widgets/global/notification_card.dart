import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../models/global/notification.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard({required this.notification, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
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
                    'Il y a 5 minutes',
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
                  onTap: () {},
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
    );
  }
}
