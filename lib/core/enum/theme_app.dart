import 'package:erudaxis/core/constants/constant.dart';
import 'package:flutter/material.dart';

enum ThemeApp {
  defaultTheme(
    key: 'default_theme',
    primary: Color(0xFF8B5CF6),
    secondary: Color(0xFF7C3AED),
    icon: Icons.auto_awesome,
  ),
  oceanBlue(
    key: 'ocean_blue',
    primary: Color(0xFF1565C0),
    secondary: Colors.blueAccent,
    icon: Icons.water_drop,
  ),
  royalPurple(
    key: 'royal_purple',
    primary: Color(0xFF6A1B9A),
    secondary: Colors.purpleAccent,
    icon: Icons.diamond,
  ),
  forestGreen(
    key: 'forest_green',
    primary: Color(0xFF005b44),
    secondary: Color(0xFF00c9a7),
    icon: Icons.eco,
  ),
  darkTeal(
    key: 'dark_teal',
    primary: Color(0xFF00695C),
    secondary: Colors.tealAccent,
    icon: Icons.waves,
  ),
  midnightBlue(
    key: 'midnight_blue',
    primary: Color(0xFF303F9F),
    secondary: Colors.indigoAccent,
    icon: Icons.nights_stay,
  ),
  goldenBrown(
    key: 'golden_brown',
    primary: Color(0xff926d00),
    secondary: Color.fromARGB(255, 116, 87, 1),
    icon: Icons.wb_sunny,
  ),
  charcoal(
    key: 'charcoal',
    primary: Colors.black,
    secondary: Color.fromARGB(255, 39, 39, 39),
    icon: Icons.dark_mode,
  ),
  turquoise(
    key: 'turquoise',
    primary: Color(0xFF008f7a),
    secondary: Color(0xff008e9b),
    icon: Icons.water,
  ),
  rosePink(
    key: 'rose_pink',
    primary: Colors.pinkAccent,
    secondary: Color.fromARGB(255, 201, 65, 110),
    icon: Icons.local_florist,
  ),
  lavender(
    key: 'lavender',
    primary: Color(0xff4b4453),
    secondary: Color.fromARGB(255, 123, 122, 124),
    icon: Icons.spa,
  ),
  crimsonRed(
    key: 'crimson_red',
    primary: Color(0xFFDC143C),
    secondary: Color(0xFFFF6B6B),
    icon: Icons.favorite,
  ),
  sunsetOrange(
    key: 'sunset_orange',
    primary: Color(0xFFFF6B35),
    secondary: Color(0xFFFF8E53),
    icon: Icons.wb_twilight,
  ),
  electricBlue(
    key: 'electric_blue',
    primary: Color(0xFF0080FF),
    secondary: Color(0xFF40A9FF),
    icon: Icons.electric_bolt,
  ),
  mintGreen(
    key: 'mint_green',
    primary: Color(0xFF00D4AA),
    secondary: Color(0xFF5DECA0),
    icon: Icons.local_cafe,
  ),
  amberGold(
    key: 'amber_gold',
    primary: Color(0xFFFFB000),
    secondary: Color(0xFFFFC947),
    icon: Icons.star,
  ),
  deepMaroon(
    key: 'deep_maroon',
    primary: Color(0xFF800020),
    secondary: Color(0xFFA0002A),
    icon: Icons.wine_bar,
  ),
  skyBlue(
    key: 'sky_blue',
    primary: Color(0xFF87CEEB),
    secondary: Color(0xFFB0E0E6),
    icon: Icons.cloud,
  ),
  emeraldGreen(
    key: 'emerald_green',
    primary: Color(0xFF50C878),
    secondary: Color(0xFF7FFFD4),
    icon: Icons.nature,
  ),
  plumPurple(
    key: 'plum_purple',
    primary: Color(0xFF8E4585),
    secondary: Color(0xFFBA68C8),
    icon: Icons.color_lens,
  ),
  copperBronze(
    key: 'copper_bronze',
    primary: Color(0xFFB87333),
    secondary: Color(0xFFCD7F32),
    icon: Icons.hardware,
  ),
  neonGreen(
    key: 'neon_green',
    primary: Color(0xFF39FF14),
    secondary: Color(0xFF7FFF00),
    icon: Icons.flash_on,
  ),
  royalBlue(
    key: 'royal_blue',
    primary: Color(0xFF4169E1),
    secondary: Color(0xFF6495ED),
    icon: Icons.castle,
  ),
  coralPink(
    key: 'coral_pink',
    primary: Color(0xFFFF7F7F),
    secondary: Color(0xFFFFB6C1),
    icon: Icons.beach_access,
  ),
  slateGray(
    key: 'slate_gray',
    primary: Color(0xFF708090),
    secondary: Color(0xFF9CB4D8),
    icon: Icons.architecture,
  ),
  burgundy(
    key: 'burgundy',
    primary: Color(0xFF800020),
    secondary: Color(0xFF922B21),
    icon: Icons.wine_bar,
  ),
  aquaMarine(
    key: 'aqua_marine',
    primary: Color(0xFF7FFFD4),
    secondary: Color(0xFF40E0D0),
    icon: Icons.pool,
  ),
  hotPink(
    key: 'hot_pink',
    primary: Color(0xFFFF1493),
    secondary: Color(0xFFFF69B4),
    icon: Icons.favorite_border,
  ),
  oliveGreen(
    key: 'olive_green',
    primary: Color(0xFF808000),
    secondary: Color(0xFF9ACD32),
    icon: Icons.grass,
  ),
  steelBlue(
    key: 'steel_blue',
    primary: Color(0xFF4682B4),
    secondary: Color(0xFF5F9EA0),
    icon: Icons.construction,
  ),
  magenta(
    key: 'magenta',
    primary: Color(0xFFFF00FF),
    secondary: Color(0xFFDA70D6),
    icon: Icons.palette,
  ),
  chocolateBrown(
    key: 'chocolate_brown',
    primary: Color(0xFFD2691E),
    secondary: Color(0xFFCD853F),
    icon: Icons.coffee,
  ),
  navyBlue(
    key: 'navy_blue',
    primary: Color(0xFF000080),
    secondary: Color(0xFF191970),
    icon: Icons.anchor,
  ),
  limeGreen(
    key: 'lime_green',
    primary: Color(0xFF32CD32),
    secondary: Color(0xFF9ACD32),
    icon: Icons.energy_savings_leaf,
  ),
  violetPurple(
    key: 'violet_purple',
    primary: Color(0xFF8A2BE2),
    secondary: Color(0xFF9370DB),
    icon: Icons.auto_fix_high,
  ),
  tangerine(
    key: 'tangerine',
    primary: Color(0xFFFF8C00),
    secondary: Color(0xFFFFA500),
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
