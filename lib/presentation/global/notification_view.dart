import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:flutter/widgets.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarGradient(
        title: const Text('Notifications'),
      ),
    );
  }
}
