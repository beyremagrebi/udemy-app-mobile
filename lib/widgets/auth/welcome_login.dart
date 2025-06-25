import 'package:erudaxis/core/constants/constant.dart';
import 'package:flutter/material.dart';

class WelcomeLogin extends StatelessWidget {
  const WelcomeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          intl.welcomeBack,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          intl.loginToContinue,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
