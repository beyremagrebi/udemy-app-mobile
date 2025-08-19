import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

class ErrorMyWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final IconData? icon;
  final Widget? action;
  final VoidCallback? onRetry;

  const ErrorMyWidget({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.action,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: Dimensions.paddingAllMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: 45,
              color: Colors.red.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              title ?? 'Something went wrong',
              style: textTheme.titleLarge?.copyWith(
                color: Colors.red.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              Dimensions.heightSmall,
              Text(
                message!,
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null || action != null) ...[
              Dimensions.heightMedium,
              action ??
                  ElevatedButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                    onPressed: onRetry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[50],
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.s),
                      ),
                    ),
                  ),
            ],
          ],
        ),
      ),
    );
  }
}
