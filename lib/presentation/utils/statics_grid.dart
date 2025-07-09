import 'package:flutter/material.dart';

class StatisticsGrid extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double aspectRatio;
  final double screenWidth;
  final ScrollPhysics? scrollPhysics;

  const StatisticsGrid({
    required this.children,
    required this.screenWidth,
    super.key,
    this.scrollPhysics = const NeverScrollableScrollPhysics(),
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 8.0,
    this.mainAxisSpacing = 8.0,
    this.aspectRatio = 2.8,
  });

  @override
  Widget build(BuildContext context) {
    final itemWidth = (screenWidth - crossAxisSpacing) / crossAxisCount;
    final itemHeight = itemWidth / aspectRatio;
    final rows = (children.length / crossAxisCount).ceil();
    final totalHeight = itemHeight * rows + mainAxisSpacing * (rows - 1);

    return SizedBox(
      height: totalHeight,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: children.length,
        physics: scrollPhysics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: aspectRatio,
        ),
        itemBuilder: (context, index) {
          return children[index];
        },
      ),
    );
  }
}
