import 'package:erudaxis/core/enum/drawer_item.dart';
import 'package:erudaxis/widgets/main/drawer/drawer_item_widget.dart';
import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scrollbar(
      controller: controller,
      thumbVisibility: true,
      child: ListView.builder(
        controller: controller,
        itemCount: DrawerItem.values.length,
        itemBuilder: (context, index) {
          return DrawerItemWidget<DrawerItem>(
            item: DrawerItem.values[index],
            size: 38,
          );
        },
      ),
    );
  }
}
