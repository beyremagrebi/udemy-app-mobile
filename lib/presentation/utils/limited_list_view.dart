import 'package:flutter/material.dart';

class LimitedListView extends StatelessWidget {
  final List<Widget> children;
  final int maxItemCount;
  final double itemHeight;
  final double separatorHeight;
  final Widget separator;

  const LimitedListView({
    required this.children,
    required this.itemHeight,
    required this.separatorHeight,
    super.key,
    this.maxItemCount = 5,
    this.separator = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    final itemCount =
        children.length > maxItemCount ? maxItemCount : children.length;
    final totalHeight =
        (itemHeight * itemCount) + (separatorHeight * (itemCount - 1));

    return SizedBox(
      height: totalHeight,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => separator,
      ),
    );
  }
}
