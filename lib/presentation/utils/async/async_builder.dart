import 'package:erudaxis/core/enum/api_status.dart';
import 'package:flutter/material.dart';

class AsyncBuilder extends StatelessWidget {
  final ApiStatus apiStatus;
  final Widget Function() onSuccess;

  const AsyncBuilder({
    required this.apiStatus,
    required this.onSuccess,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (apiStatus) {
      case ApiStatus.success:
        return onSuccess.call();
      case ApiStatus.loading:
        return const Text('loading');
      case ApiStatus.error:
        return const Text('error');
    }
  }
}
