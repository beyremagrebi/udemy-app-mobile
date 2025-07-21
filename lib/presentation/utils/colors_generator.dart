import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

Color getColorFromHash(int hash) {
  final int r = (hash & 0xFF0000) >> 16;
  final int g = (hash & 0x00FF00) >> 8;
  final int b = hash & 0x0000FF;
  return Color.fromARGB(255, r, g, b).withOpacity(1);
}

IconData getIconFromName(String name) {
  final hash = name.hashCode.abs();
  final icons = [
    Symbols.science, // For science classes
    Symbols.calculate, // Math
    Symbols.language, // Language or Literature
    Symbols.book_5, // General education
    Symbols.history_edu, // History, philosophy
    Symbols.computer, // Informatique
    Symbols.biotech, // Biology / Lab
    Symbols.engineering, // Engineering or physics
    Symbols.auto_stories, // Reading / Literature
    Symbols.explore, // Geography
    Symbols.palette, // Art
    Symbols.mic_external_on, // Music
    Symbols.sports_soccer, // Sport
    Symbols.psychology_alt, // Psychology / Human Sciences
    Symbols.eco, // Economy / Environment
    Symbols.account_tree, // Logic or Structure-based
    Symbols.lightbulb, // Innovation / Ideas
    Symbols.public, // Social science / Global topics
    Symbols.draw, // Drawing / Manual arts
    Symbols.terminal, // Programming / Terminal
  ];

  return icons[hash % icons.length];
}
