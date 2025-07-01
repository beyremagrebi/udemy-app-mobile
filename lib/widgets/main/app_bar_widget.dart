import 'package:erudaxis/core/constants/constant.dart';
import 'package:flutter/material.dart';

import '../../core/styles/dimensions.dart';

Widget? appBarWidget(BuildContext context) {
  return Row(
    children: [
      const Icon(Icons.school_outlined),
      Dimensions.widthSmall,
      Text(intl.appName),
    ],
  );
}
