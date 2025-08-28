import 'package:erudaxis/models/global/user.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../presentation/utils/colors_generator.dart';
import '../../../../presentation/utils/icon_box.dart';

class IconHeaderWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final User? creator;

  const IconHeaderWidget(
      {required this.icon, required this.title, this.creator, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconBox(
          icon: Symbols.book_5_rounded,
          iconBackgroundColor: getColorFromHash(title.hashCode),
        ),
        Dimensions.widthSmall,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${creator?.firstName} ${creator?.lastName} (${creator?.role?.localizedName()}) ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
