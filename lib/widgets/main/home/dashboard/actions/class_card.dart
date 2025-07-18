import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../presentation/main/home/dashboard/actions/classe_details.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigateTo(context, const ClasseDetails());
          },
          child: Padding(
            padding: Dimensions.paddingAllSmall,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const IconBox(
                      icon: Icons.square_foot_outlined,
                      size: 50,
                      iconBackgroundColor: Colors.blueAccent,
                    ),
                    Dimensions.widthSmall,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Terminale S - Groupe A',
                          style: textTheme.titleMedium?.copyWith(),
                        ),
                        Text(
                          'Sciences • Prof. Dubois',
                          style: textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          'Classe de Terminale Scientifique - Section A',
                          style: textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        Dimensions.heightSmall,
                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              size: 16,
                              color: Colors.white70,
                            ),
                            Dimensions.widthxSmall,
                            Text(
                              '4',
                              style: textTheme.labelSmall?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                            Dimensions.widthSmall,
                            Expanded(
                              child: Text(
                                'il ya 30mn',
                                style: textTheme.labelSmall?.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            const IconBox(
                              icon: Icons.chat_outlined,
                              size: 30,
                            ),
                            Dimensions.widthSmall,
                            const IconBox(
                              icon: Icons.date_range_outlined,
                              size: 30,
                            ),
                          ],
                        ),
                        Dimensions.heightSmall,
                        Card(
                          elevation: 0,
                          child: Padding(
                            padding: Dimensions.paddingAllSmall,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Symbols.book_5_rounded,
                                  color: Colors.white70,
                                  size: 18,
                                ),
                                Dimensions.widthxSmall,
                                Flexible(
                                  child: Text(
                                    'Prochain cours: Mathématiques - Demain 8h00',
                                    maxLines: 2,
                                    style: textTheme.labelSmall?.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                    const Icon(Icons.more_vert_outlined)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
