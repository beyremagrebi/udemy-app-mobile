import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/presentation/main/subject/subject_details_view.dart';
import 'package:erudaxis/presentation/utils/colors_generator.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';

class SubjectCard extends IScreenWithLocalization {
  final BaseSubject subject;
  const SubjectCard({required this.subject, super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigateTo(context, SubjectDetailsView(subject: subject));
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
                      icon: getIconFromName(subject.name ?? intl.error),
                      size: 35,
                      iconBackgroundColor:
                          getColorFromHash(subject.name.hashCode),
                    ),
                    Dimensions.widthSmall,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject.name?.toUpperCase() ?? intl.error,
                          style: textTheme.titleMedium?.copyWith(),
                        ),
                        Text(
                          FacilityManager.facility.name?.toUpperCase() ??
                              intl.error,
                          style: textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        Dimensions.heightSmall,
                        Text(
                          intl.subject_quote,
                          style: textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
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
