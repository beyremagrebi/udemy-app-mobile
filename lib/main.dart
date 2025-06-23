import 'package:erudaxis/core/config/app_launch.dart';
import 'package:erudaxis/core/themes/app_theme.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:flutter/material.dart';

import 'core/constants/constant.dart';

Future<void> main() async {
  await AppLaunch.preExecution();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: mainnavigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      themeMode: ThemeMode.system,
      home: const LoginView(),
    );
  }
}
