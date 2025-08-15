import 'package:erudaxis/core/enum/api_status.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common/error_widget.dart';

class AsyncBuilder extends StatelessWidget {
  final ApiStatus apiStatus;
  final Widget Function() onSuccess;
  final Widget? shimmer;
  const AsyncBuilder({
    required this.apiStatus,
    required this.onSuccess,
    this.shimmer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (apiStatus) {
      case ApiStatus.success:
        return onSuccess.call();
      case ApiStatus.loading:
        if (shimmer == null) {
          return const SizedBox.shrink();
        }
        return shimmer!;
      case ApiStatus.error:
        return const ErrorMyWidget();
    }
  }
}
