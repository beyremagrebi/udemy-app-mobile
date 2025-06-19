import 'package:flutter/material.dart';

import '../../core/styles/dimensions.dart';

Widget? appBarWidget(BuildContext context) {
  return const Row(
    children: [
      Icon(Icons.book),
      Dimensions.widthSmall,
      Text('Erudaxis'),
    ],
  );
}
