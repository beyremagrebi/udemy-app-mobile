import 'package:erudaxis/core/themes/app_theme.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:flutter/material.dart';

import 'core/constants/constant.dart';

void main() {
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
      home: const LoginView(),
    );
  }
}
