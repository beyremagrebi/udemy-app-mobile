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
      lower.contains('geometry') ||
      lower.contains('calculus') ||
      lower.contains('arithmetic') ||
      lower.contains('statistic') ||
      lower.contains('trigonometry')) {
    return Symbols.calculate;
  } else if (lower.contains('science') ||
      lower.contains('physic') ||
      lower.contains('chemistry') ||
      lower.contains('lab')) {
    return Symbols.science;
  } else if (lower.contains('biology') ||
      lower.contains('bio') ||
      lower.contains('genetic') ||
      lower.contains('anatomy')) {
    return Symbols.biotech;
  } else if (lower.contains('history') ||
      lower.contains('philosophy') ||
      lower.contains('civics') ||
      lower.contains('ethic')) {
    return Symbols.history_edu;
  } else if (lower.contains('language') ||
      lower.contains('literature') ||
      lower.contains('french') ||
      lower.contains('english') ||
      lower.contains('arabic') ||
      lower.contains('grammar')) {
    return Symbols.language;
  } else if (lower.contains('computer') ||
      lower.contains('informatics') ||
      lower.contains('it') ||
      lower.contains('information technology')) {
    return Symbols.computer;
  } else if (lower.contains('programming') ||
      lower.contains('coding') ||
      lower.contains('software') ||
      lower.contains('terminal') ||
      lower.contains('code') ||
      lower.contains('development')) {
    return Symbols.terminal;
  } else if (lower.contains('art') ||
      lower.contains('drawing') ||
      lower.contains('painting') ||
      lower.contains('design')) {
    return Symbols.palette;
  } else if (lower.contains('music') ||
      lower.contains('singing') ||
      lower.contains('instrument')) {
    return Symbols.mic_external_on;
  } else if (lower.contains('geography') ||
      lower.contains('earth') ||
      lower.contains('climate') ||
      lower.contains('map')) {
    return Symbols.explore;
  } else if (lower.contains('sport') ||
      lower.contains('physical') ||
      lower.contains('pe') ||
      lower.contains('fitness')) {
    return Symbols.sports_soccer;
  } else if (lower.contains('psychology') ||
      lower.contains('social') ||
      lower.contains('sociology') ||
      lower.contains('mental')) {
    return Symbols.psychology_alt;
  } else if (lower.contains('economy') ||
      lower.contains('finance') ||
      lower.contains('business') ||
      lower.contains('accounting') ||
      lower.contains('marketing')) {
    return Symbols.eco;
  } else if (lower.contains('engineering') ||
      lower.contains('mechanic') ||
      lower.contains('electrical') ||
      lower.contains('civil') ||
      lower.contains('robotics')) {
    return Symbols.engineering;
  } else if (lower.contains('logic') ||
      lower.contains('structure') ||
      lower.contains('algorithm') ||
      lower.contains('reasoning')) {
    return Symbols.account_tree;
  } else if (lower.contains('innovation') ||
      lower.contains('idea') ||
      lower.contains('creativity') ||
      lower.contains('entrepreneur')) {
    return Symbols.lightbulb;
  } else if (lower.contains('medicine') ||
      lower.contains('nursing') ||
      lower.contains('health') ||
      lower.contains('pharmacy') ||
      lower.contains('clinical')) {
    return Symbols.medical_services;
  } else if (lower.contains('law') ||
      lower.contains('legal') ||
      lower.contains('justice') ||
      lower.contains('criminology')) {
    return Symbols.gavel;
  } else if (lower.contains('religion') ||
      lower.contains('islam') ||
      lower.contains('christian') ||
      lower.contains('bible') ||
      lower.contains('quran')) {
    return Symbols.auto_stories;
  } else if (lower.contains('language sign') ||
      lower.contains('deaf') ||
      lower.contains('sign')) {
    return Symbols.accessibility_new;
  } else if (lower.contains('communication') ||
      lower.contains('media') ||
      lower.contains('journalism') ||
      lower.contains('speech')) {
    return Symbols.forum;
  } else {
    return Symbols.book_5; // Default/general education icon
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
