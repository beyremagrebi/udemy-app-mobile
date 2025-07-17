import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/enum/drawer_item.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/drawer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerItemWidget<T extends Enum> extends StatelessWidget {
  final double size;
  final DrawerItem item;
  const DrawerItemWidget({
    required this.item,
    super.key,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerViewModel>(
      builder: (context, viewModel, child) {
        final bool isSelected = viewModel.selectedItem == item;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              viewModel.onTapItem(item);
            },
            child: Container(
              padding: Dimensions.paddingAllSmall,
              decoration: BoxDecoration(
                color: isSelected
                    ? item.color.withOpacity(0.1)
                    : Colors.transparent,
              ),
              child: Row(
                children: [
                  Card(
                    elevation: 0,
                    color: isSelected ? item.color.withOpacity(0.2) : null,
                    child: Container(
                      width: size,
                      height: size,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: Dimensions.smallBorderRadius,
                      ),
                      child: Icon(
                        item.icon,
                        color: isSelected
                            ? item.color
                            : item.color.withOpacity(0.6),
                        size: size * 0.55,
                      ),
                    ),
                  ),
                  Dimensions.widthMedium,
                  Text(
                    item.localizedName(),
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? item.color : null,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
