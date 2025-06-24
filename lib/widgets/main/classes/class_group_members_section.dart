import 'package:flutter/material.dart';
import 'member_item.dart';

class ClassGroupMembersSection extends StatelessWidget {
  final List<Map<String, dynamic>> members;
  final VoidCallback onSeeAll;
  final VoidCallback onSeeMore;
  const ClassGroupMembersSection({
    required this.members,
    required this.onSeeAll,
    required this.onSeeMore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Membres',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B5CF6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        members.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Voir tous',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ...members.take(3).map((m) => MemberItem(
          name: m['name'] as String,
          role: m['role'] as String,
          icon: m['icon'] as IconData,
          color: m['color'] as Color,
          isTeacher: (m['isTeacher'] ?? false) as bool,
        )),

        const SizedBox(height: 12),
        GestureDetector(
          onTap: onSeeMore,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF4C1D95),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Voir 3 membres de plus',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
