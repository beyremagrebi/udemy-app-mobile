import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/widgets/main/classes/class_model.dart';
import 'package:flutter/material.dart';

import '../../common/form/input_text.dart';
import '../../common/widgets.dart';
import 'class_card.dart';

class MesClassesScreen extends StatefulWidget {
  const MesClassesScreen({super.key});

  @override
  State<MesClassesScreen> createState() => _MesClassesScreenState();
}

class _MesClassesScreenState extends State<MesClassesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<ClassModel> classes = [
    ClassModel(
      title: 'Terminale S - Groupe A',
      subject: 'Sciences',
      teacher: 'Prof. Dubois',
      description: 'Classe de Terminale Scientifique - Section A',
      studentCount: 28,
      lastActivity: 'Il y a 2 heures',
      nextCourse: 'Mathématiques - Demain 8h00',
      iconColor: const Color(0xFF4FC3F7),
      icon: Icons.science,
    ),
    ClassModel(
      title: 'Groupe Projet Physique',
      subject: 'Physique',
      teacher: 'Prof. Martin',
      description: 'Projet de recherche en mécanique quantique',
      studentCount: 4,
      lastActivity: 'Il y a 30 minutes',
      nextCourse: 'Présentation - Vendredi 14h00',
      iconColor: const Color(0xFF66BB6A),
      icon: Icons.psychology,
    ),
    ClassModel(
      title: 'Club Mathématiques',
      subject: 'Mathématiques',
      teacher: 'Prof. Leroy',
      description: 'Club de mathématiques pour les passionnés',
      studentCount: 15,
      lastActivity: 'Il y a 1 jour',
      nextCourse: 'Réunion - Lundi 16h00',
      iconColor: const Color(0xFFAB47BC),
      icon: Icons.calculate,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: gradientSurfaceWidget(
        Column(
          children: [
            // Gradient App Bar with title, add button, and search bar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: Dimensions.l,
                right: Dimensions.l,
                top: 48, // for status bar spacing
                bottom: Dimensions.l,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7F53FF), Color(0xFF5E61F4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Mes Classes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.person_add_alt_1,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  InputText(
                    controller: _searchController,
                    hintText: 'Rechercher une classe...',
                    prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    onChanged: (value) => setState(() {}),
                  ),
                ],
              ),
            ),
            Dimensions.heightMedium,
            // List of classes
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Dimensions.l),
                    children: classes
                        .where((c) =>
                            _searchController.text.isEmpty ||
                            c.title.toLowerCase().contains(
                                _searchController.text.toLowerCase()) ||
                            c.subject.toLowerCase().contains(
                                _searchController.text.toLowerCase()) ||
                            c.teacher
                                .toLowerCase()
                                .contains(_searchController.text.toLowerCase()))
                        .map((c) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: constraints.maxWidth,
                                ),
                                child: ClassCard(classModel: c),
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
