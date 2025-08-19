import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../core/constants/constant.dart';
import '../../../../presentation/utils/icon_box.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            const IconBox(
              icon: Symbols.book_5_rounded,
              iconBackgroundColor: Colors.green,
              size: 44,
            ),
            Dimensions.widthSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course 1',
                    style: textTheme.titleMedium,
                  ),
                  Dimensions.widthSmall,
                  Text(
                    'beyrem Agrebi',
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.lock_outline_rounded,
              size: 20,
            ),
            Dimensions.widthxSmall,
            const Icon(Icons.navigate_next_outlined)
          ],
        ),
      ),
    );
  }
}
