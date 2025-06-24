import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinLoading extends StatelessWidget {
  const SpinLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitDualRing(
      color: Theme.of(context).colorScheme.primary,
      size: 35,
    );
  }
}
