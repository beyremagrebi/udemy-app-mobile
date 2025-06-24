import 'package:flutter/material.dart';
import 'activity_item.dart';

class ClassGroupActivitySection extends StatelessWidget {
  final List<Map<String, dynamic>> activities;
  const ClassGroupActivitySection({required this.activities, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Activité récente',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...activities.map((a) => ActivityItem(
              icon: a['icon'] as IconData,
              title: a['title'] as String,
              time: a['time'] as String,
              color: a['color'] as Color,
            )),

      ],
    );
  }
}
