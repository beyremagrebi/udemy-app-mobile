import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/main/home/dashboard/quizz/quiz_a_faire_card.dart';
import '../../../../utils/limited_list_view.dart';

class QuizAFaireView extends StatelessWidget {
  const QuizAFaireView({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzes = [
      {
        'title': 'Quiz Mathématiques',
        'teacher': 'Mme. Leblanc',
        'deadline': '24 Juin',
        'status': 'À faire',
      },
      {
        'title': 'Quiz Physique',
        'teacher': 'M. Einstein',
        'deadline': '25 Juin',
        'status': 'À faire',
      },
      {
        'title': 'Quiz Histoire',
        'teacher': 'Mme. Curie',
        'deadline': '28 Juin',
        'status': 'À faire',
      },
    ];

    final items = quizzes
        .map((quiz) => QuizAFaireCard(
              title: quiz['title']!,
              teacher: quiz['teacher']!,
              deadline: quiz['deadline']!,
              status: quiz['status']!,
            ))
        .toList();

    return LimitedListView(
      children: items,
      itemHeight: 62,
      separatorHeight: 10,
      separator: Dimensions.heightSmall,
    );
  }
}
