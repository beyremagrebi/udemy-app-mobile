import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/session/session_manager.dart';
import 'package:flutter/material.dart';

class MainHeaderWidget extends StatelessWidget {
  const MainHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: Dimensions.horizontalPaddingMedium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Profile avatar
              const CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFFEF3C7),
                child: Icon(Icons.person, color: Color(0xFFF59E0B), size: 34),
              ),
              Dimensions.widthMedium,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bonjour, ${SessionManager.user?.firstName?.toUpperCase()} 👋',
                      style: textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Dimensions.widthSmall,
                    Text(
                      'Lycée Victor Hugo • Terminale S',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.92),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Dimensions.heightHuge,
        ],
      ),
    );
  }
}
