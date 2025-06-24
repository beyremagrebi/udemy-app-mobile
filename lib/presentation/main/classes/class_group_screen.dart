import 'package:erudaxis/widgets/main/classes/class_group_activity_section.dart';
import 'package:erudaxis/widgets/main/classes/class_group_members_section.dart';
import 'package:flutter/material.dart';

import '../../../widgets/main/classes/class_group_action_button.dart';
import '../../../widgets/main/classes/class_group_header.dart';
import '../../../widgets/main/classes/class_group_stat_item.dart';
import '../../../widgets/main/classes/class_info_card.dart';

class ClassGroupScreen extends StatelessWidget {
  const ClassGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      {
        'name': 'Jean Dupont',
        'role': 'Student',
        'icon': Icons.person,
        'color': const Color(0xFF3B82F6),
        'isTeacher': false,
      },
      {
        'name': 'Marie Martin',
        'role': 'Student',
        'icon': Icons.person,
        'color': const Color(0xFF8B5CF6),
        'isTeacher': false,
      },
      {
        'name': 'Prof. Dubois',
        'role': 'Teacher',
        'icon': Icons.school,
        'color': const Color(0xFF10B981),
        'isTeacher': true,
      },
    ];
    final activities = [
      {
        'icon': Icons.add_circle,
        'title': 'Nouveau cours ajouté',
        'time': 'Il y a 2 heures',
        'color': const Color(0xFF3B82F6),
      },
      {
        'icon': Icons.person_add,
        'title': 'Sophie a rejoint la classe',
        'time': 'Il y a 1 jour',
        'color': const Color(0xFF10B981),
      },
    ];
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B5FBF),
              Color(0xFF6B46C1),
              Color(0xFF553C9A),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              ClassGroupHeader(
                onBack: () => Navigator.of(context).pop(),
                onAddGroup: () {},
                onSettings: () {},
              ),
              const ClassInfoCard(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClassGroupStatItem(value: '28', label: 'Membres'),
                    ClassGroupStatItem(value: '12', label: 'Cours'),
                    ClassGroupStatItem(value: '85%', label: 'Présence'),
                    ClassGroupStatItem(value: '4.8', label: 'Note'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ClassGroupActionButton(
                        icon: Icons.chat_bubble_outline,
                        label: 'Chat',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClassGroupActionButton(
                        icon: Icons.phone,
                        label: 'Appel',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ClassGroupActionButton(
                        icon: Icons.calendar_today,
                        label: 'Planning',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClassGroupActionButton(
                        icon: Icons.book,
                        label: 'Cours',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color(0xFF2D1B69),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ClassGroupMembersSection(
                        members: members,
                        onSeeAll: () {},
                        onSeeMore: () {},
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child:
                            ClassGroupActivitySection(activities: activities),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
