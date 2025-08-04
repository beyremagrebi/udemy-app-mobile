import 'package:erudaxis/presentation/global/notification_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationViewModel>(
      builder: (context, viewModel, child) => Stack(
        children: [
          IconButton(
            onPressed: () async {
              await viewModel.readAllNotifications();
              if (context.mounted) {
                navigateTo(context, const NotificationView());
              }
            },
            icon: const Icon(Symbols.notifications_none_rounded),
          ),
          if (viewModel.notificationCount > 0)
            Positioned(
              right: 10,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Center(
                  child: Text(
                    viewModel.notificationCount > 99
                        ? '99+'
                        : '${viewModel.notificationCount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
