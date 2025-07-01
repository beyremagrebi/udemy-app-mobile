import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

abstract class BaseShimmer extends StatelessWidget {
  final Widget child = Container();

  BaseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:
          const Color.fromARGB(255, 211, 211, 211), // slate-100 equivalent
      highlightColor: const Color(0xFFF8FAFC), // slate-50 equivalent
      child: child,
    );
  }
}
