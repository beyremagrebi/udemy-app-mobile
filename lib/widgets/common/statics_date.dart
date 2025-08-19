import 'package:flutter/material.dart';

class StatisticsDate extends StatelessWidget {
  final String title;
  final String value;

  const StatisticsDate({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          value,
          style: textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: textTheme.labelSmall?.copyWith(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
