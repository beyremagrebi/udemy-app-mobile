import 'package:erudaxis/core/config/app_launch.dart';
import 'package:erudaxis/erudaxis.dart';
import 'package:flutter/material.dart';

/// MAIN APP  [BEYREM]
Future<void> main() async {
  await AppLaunch.preExecution();
  runApp(const Erudaxis());
}
