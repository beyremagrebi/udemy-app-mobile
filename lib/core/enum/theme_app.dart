import 'package:erudaxis/core/constants/constant.dart';
import 'package:flutter/material.dart';

enum ThemeApp {
  defaultTheme(
    key: 'default_theme',
    primary: Color(0xFF6D28D9),
    secondary: Color(0xFF8B5CF6),
    icon: Icons.auto_awesome,
  ),
  oceanBlue(
    key: 'ocean_blue',
    primary: Color(0xFF1E40AF),
    secondary: Color(0xFF3B82F6),
    icon: Icons.water_drop,
  ),
  royalPurple(
    key: 'royal_purple',
    primary: Color(0xFF5B21B6),
    secondary: Color(0xFF7C3AED),
    icon: Icons.diamond,
  ),
  forestGreen(
    key: 'forest_green',
    primary: Color(0xFF166534),
    secondary: Color(0xFF22C55E),
    icon: Icons.eco,
  ),
  darkTeal(
    key: 'dark_teal',
    primary: Color(0xFF0F766E),
    secondary: Color(0xFF14B8A6),
    icon: Icons.waves,
  ),
  midnightBlue(
    key: 'midnight_blue',
    primary: Color(0xFF1E3A8A),
    secondary: Color(0xFF3B82F6),
    icon: Icons.nights_stay,
  ),
  goldenBrown(
    key: 'golden_brown',
    primary: Color(0xFF7C4D12), // Rich, deep golden brown
    secondary: Color(0xFFD4A017), // Muted antique gold
    icon: Icons.wb_sunny,
  ),
  charcoal(
    key: 'charcoal',
    primary: Color(0xFF000000),
    secondary: Color(0xFF121212),
    icon: Icons.dark_mode,
  ),
  turquoise(
    key: 'turquoise',
    primary: Color(0xFF0D9488),
    secondary: Color(0xFF2DD4BF),
    icon: Icons.water,
  ),
  rosePink(
    key: 'rose_pink',
    primary: Color(0xFF7A2D52),
    secondary: Color(0xFFB87B9B),
    icon: Icons.local_florist,
  ),
  lavender(
    key: 'lavender',
    primary: Color(0xFF6B21A8),
    secondary: Color(0xFF9333EA),
    icon: Icons.spa,
  ),
  crimsonRed(
    key: 'crimson_red',
    primary: Color(0xFF991B1B),
    secondary: Color(0xFFDC2626),
    icon: Icons.favorite,
  ),
  sunsetOrange(
    key: 'sunset_orange',
    primary: Color(0xFF9A3412),
    secondary: Color(0xFFEA580C),
    icon: Icons.wb_twilight,
  ),
  electricBlue(
    key: 'electric_blue',
    primary: Color(0xFF1D4ED8),
    secondary: Color(0xFF3B82F6),
    icon: Icons.electric_bolt,
  ),
  mintGreen(
    key: 'mint_green',
    primary: Color(0xFF047857),
    secondary: Color(0xFF10B981),
    icon: Icons.local_cafe,
  ),
  amberGold(
    key: 'amber_gold',
    primary: Color(0xFFB45309),
    secondary: Color(0xFFF59E0B),
    icon: Icons.star,
  ),
  deepMaroon(
    key: 'deep_maroon',
    primary: Color(0xFF831843),
    secondary: Color(0xFFBE185D),
    icon: Icons.wine_bar,
  ),
  skyBlue(
    key: 'sky_blue',
    primary: Color(0xFF0369A1),
    secondary: Color(0xFF0EA5E9),
    icon: Icons.cloud,
  ),
  emeraldGreen(
    key: 'emerald_green',
    primary: Color(0xFF065F46),
    secondary: Color(0xFF059669),
    icon: Icons.nature,
  ),
  plumPurple(
    key: 'plum_purple',
    primary: Color(0xFF6B21A8),
    secondary: Color(0xFF9333EA),
    icon: Icons.color_lens,
  ),
  copperBronze(
    key: 'copper_bronze',
    primary: Color(0xFF92400E),
    secondary: Color(0xFFB45309),
    icon: Icons.hardware,
  ),
  neonGreen(
    key: 'neon_green',
    primary: Color(0xFF0D8E5B), // Deep teal-green
    secondary: Color(0xFF2ECC71), // Muted neon
    icon: Icons.flash_on,
  ),
  royalBlue(
    key: 'royal_blue',
    primary: Color(0xFF1E40AF),
    secondary: Color(0xFF3B82F6),
    icon: Icons.castle,
  ),
  coralPink(
    key: 'coral_pink',
    primary: Color(0xFF9C4221), // Burnt coral
    secondary: Color(0xFFE9967A), // Salmon pink
    icon: Icons.beach_access,
  ),
  slateGray(
    key: 'slate_gray',
    primary: Color(0xFF1F2937),
    secondary: Color(0xFF374151),
    icon: Icons.architecture,
  ),
  burgundy(
    key: 'burgundy',
    primary: Color(0xFF831843),
    secondary: Color(0xFF9D174D),
    icon: Icons.wine_bar,
  ),
  aquaMarine(
    key: 'aqua_marine',
    primary: Color(0xFF0D9488),
    secondary: Color(0xFF2DD4BF),
    icon: Icons.pool,
  ),
  hotPink(
    key: 'hot_pink',
    primary: Color(0xFFBE185D),
    secondary: Color(0xFFEC4899),
    icon: Icons.favorite_border,
  ),
  oliveGreen(
    key: 'olive_green',
    primary: Color(0xFF3F6212),
    secondary: Color(0xFF65A30D),
    icon: Icons.grass,
  ),
  steelBlue(
    key: 'steel_blue',
    primary: Color(0xFF1E40AF),
    secondary: Color(0xFF3B82F6),
    icon: Icons.construction,
  ),
  magenta(
    key: 'magenta',
    primary: Color(0xFF831843),
    secondary: Color(0xFFBE185D),
    icon: Icons.palette,
  ),
  chocolateBrown(
    key: 'chocolate_brown',
    primary: Color(0xFF78350F),
    secondary: Color(0xFF92400E),
    icon: Icons.coffee,
  ),
  navyBlue(
    key: 'navy_blue',
    primary: Color(0xFF1E3A8A),
    secondary: Color(0xFF3B82F6),
    icon: Icons.anchor,
  ),
  limeGreen(
    key: 'lime_green',
    primary: Color(0xFF3F6212),
    secondary: Color(0xFF65A30D),
    icon: Icons.energy_savings_leaf,
  ),
  violetPurple(
    key: 'violet_purple',
    primary: Color(0xFF5B21B6),
    secondary: Color(0xFF7C3AED),
    icon: Icons.auto_fix_high,
  ),
  tangerine(
    key: 'tangerine',
    primary: Color(0xFF7F2D0D), // Deep burnt orange
    secondary: Color(0xFFD1581A), // Soft terracotta
    icon: Icons.wb_sunny_outlined,
  );

  final String key;
  final Color primary;
  final Color secondary;
  final IconData icon;

  const ThemeApp({
    required this.key,
    required this.icon,
    required this.primary,
    required this.secondary,
  });

  // Get localized name using the context
  String getLocalizedName() {
    switch (this) {
      case ThemeApp.defaultTheme:
        return intl.default_theme;
      case ThemeApp.oceanBlue:
        return intl.ocean_blue;
      case ThemeApp.royalPurple:
        return intl.royal_purple;
      case ThemeApp.forestGreen:
        return intl.forest_green;
      case ThemeApp.darkTeal:
        return intl.dark_teal;
      case ThemeApp.midnightBlue:
        return intl.midnight_blue;
      case ThemeApp.goldenBrown:
        return intl.golden_brown;
      case ThemeApp.charcoal:
        return intl.charcoal;
      case ThemeApp.turquoise:
        return intl.turquoise;
      case ThemeApp.rosePink:
        return intl.rose_pink;
      case ThemeApp.lavender:
        return intl.lavender;
      case ThemeApp.crimsonRed:
        return intl.crimson_red;
      case ThemeApp.sunsetOrange:
        return intl.sunset_orange;
      case ThemeApp.electricBlue:
        return intl.electric_blue;
      case ThemeApp.mintGreen:
        return intl.mint_green;
      case ThemeApp.amberGold:
        return intl.amber_gold;
      case ThemeApp.deepMaroon:
        return intl.deep_maroon;
      case ThemeApp.skyBlue:
        return intl.sky_blue;
      case ThemeApp.emeraldGreen:
        return intl.emerald_green;
      case ThemeApp.plumPurple:
        return intl.plum_purple;
      case ThemeApp.copperBronze:
        return intl.copper_bronze;
      case ThemeApp.neonGreen:
        return intl.neon_green;
      case ThemeApp.royalBlue:
        return intl.royal_blue;
      case ThemeApp.coralPink:
        return intl.coral_pink;
      case ThemeApp.slateGray:
        return intl.slate_gray;
      case ThemeApp.burgundy:
        return intl.burgundy;
      case ThemeApp.aquaMarine:
        return intl.aqua_marine;
      case ThemeApp.hotPink:
        return intl.hot_pink;
      case ThemeApp.oliveGreen:
        return intl.olive_green;
      case ThemeApp.steelBlue:
        return intl.steel_blue;
      case ThemeApp.magenta:
        return intl.magenta;
      case ThemeApp.chocolateBrown:
        return intl.chocolate_brown;
      case ThemeApp.navyBlue:
        return intl.navy_blue;
      case ThemeApp.limeGreen:
        return intl.lime_green;
      case ThemeApp.violetPurple:
        return intl.violet_purple;
      case ThemeApp.tangerine:
        return intl.tangerine;
    }
  }
}
