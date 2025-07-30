import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/training_center/class_tc.dart';
import 'package:erudaxis/presentation/utils/colors_generator.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../presentation/main/home/dashboard/class/classe_details.dart';

class ClassCard extends StatelessWidget {
  final BaseClass classe;
  const ClassCard({required this.classe, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigateTo(
              context,
              ClasseDetails(
                classe: classe,
              ),
            );
          },
          child: Padding(
            padding: Dimensions.paddingAllSmall,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconBox(
                      icon: getIconFromName(classe.name ?? ''),
                      size: 50,
                      iconBackgroundColor:
                          getColorFromHash(classe.name.hashCode),
                    ),
                    Dimensions.widthSmall,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          classe.name!.toUpperCase(),
                          style: textTheme.titleMedium?.copyWith(),
                        ),
                        Text(
                          'Sciences • Prof. Dubois',
                          style: textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        if (classe.isTtrainingCenter) ...[
                          Text(
                            '${DateFormat("d MMMM y", 'fr').format(DateTime.tryParse((classe as ClassTc).startDate ?? '') ?? DateTime.now())}  - ${DateFormat("d MMMM y", 'fr').format(DateTime.tryParse((classe as ClassTc).endDate ?? '') ?? DateTime.now())}',
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ] else ...[
                          Text(
                            FacilityManager.facility.name?.toUpperCase() ?? '',
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ],
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
                              classe.students?.length.toString() ?? '0',
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
