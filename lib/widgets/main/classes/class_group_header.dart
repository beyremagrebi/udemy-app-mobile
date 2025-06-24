import 'package:flutter/material.dart';

class ClassGroupHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onAddGroup;
  final VoidCallback onSettings;
  const ClassGroupHeader({
    required this.onBack, required this.onAddGroup, required this.onSettings, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBack,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.group_add, color: Colors.white),
            onPressed: onAddGroup,
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: onSettings,
          ),
        ],
      ),
    );
  }
}
