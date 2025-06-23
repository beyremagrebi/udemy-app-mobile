import 'package:erudaxis/core/config/app_launch.dart';
import 'package:erudaxis/erudaxis.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppLaunch.preExecution();
  runApp(const Erudaxis());
}
