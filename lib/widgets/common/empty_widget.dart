import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/widgets/common/gradient_button.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final IconData? icon;

  final Future<void> Function()? onRefresh;

  const EmptyWidget({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: Dimensions.paddingAllExtraLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            Dimensions.heightSmall,
            Text(
              title ?? intl.no_data_available,
              style: textTheme.titleLarge?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              Dimensions.heightSmall,
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[500],
                    ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onRefresh != null) ...[
              Dimensions.heightMedium,
              GradientButton(
                text: intl.refresh,
                onPressed: onRefresh,
              )
            ]
          ],
        ),
      ),
    );
  }
}
