import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

Color getColorFromHash(int hash) {
  final int r = (hash & 0xFF0000) >> 16;
  final int g = (hash & 0x00FF00) >> 8;
  final int b = hash & 0x0000FF;
  return Color.fromARGB(255, r, g, b).withOpacity(1);
}

IconData getCourseIconFromName(String name) {
  final lower = name.toLowerCase();

  if (lower.contains('math') ||
      lower.contains('algebra') ||
      lower.contains('geometry')) {
    return Symbols.calculate;
  } else if (lower.contains('science') ||
      lower.contains('physic') ||
      lower.contains('chemistry')) {
    return Symbols.science;
  } else if (lower.contains('biology') || lower.contains('bio')) {
    return Symbols.biotech;
  } else if (lower.contains('history') || lower.contains('philosophy')) {
    return Symbols.history_edu;
  } else if (lower.contains('language') ||
      lower.contains('literature') ||
      lower.contains('french')) {
    return Symbols.language;
  } else if (lower.contains('computer') || lower.contains('informatics')) {
    return Symbols.computer;
  } else if (lower.contains('art') || lower.contains('drawing')) {
    return Symbols.palette;
  } else if (lower.contains('music')) {
    return Symbols.mic_external_on;
  } else if (lower.contains('geography')) {
    return Symbols.explore;
  } else if (lower.contains('sport') || lower.contains('physical')) {
    return Symbols.sports_soccer;
  } else if (lower.contains('psychology') || lower.contains('social')) {
    return Symbols.psychology_alt;
  } else if (lower.contains('economy') || lower.contains('finance')) {
    return Symbols.eco;
  } else if (lower.contains('engineering') || lower.contains('mechanic')) {
    return Symbols.engineering;
  } else if (lower.contains('logic') || lower.contains('structure')) {
    return Symbols.account_tree;
  } else if (lower.contains('innovation') || lower.contains('idea')) {
    return Symbols.lightbulb;
  } else if (lower.contains('terminal') ||
      lower.contains('code') ||
      lower.contains('programming')) {
    return Symbols.terminal;
  } else {
    // Default icon for unknown course types
    return Symbols.book_5;
  }
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
