import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;
  final double size;
  final bool canNavigate;
  final Widget? materialPage;
  final VoidCallback? onTap;
  const SettingCard({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color,
    this.onTap,
    this.canNavigate = true,
    this.materialPage,
    super.key,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (onTap != null) {
              onTap?.call();
            }
            if (canNavigate == true && materialPage != null) {
              navigateTo(context, materialPage!);
            }
          },
          child: Padding(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              children: [
                IconBox(
                  icon: icon,
                  iconBackgroundColor: color,
                  size: size,
                ),
                Dimensions.widthSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey.shade300, fontSize: 11),
                    ),
                  ],
                ),
                if (canNavigate) ...[
                  const Expanded(child: Dimensions.widthSmall),
                  const Icon(Icons.navigate_next)
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
