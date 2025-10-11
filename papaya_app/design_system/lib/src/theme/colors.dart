import 'package:flutter/material.dart';

class F1SemanticColors {
  // Feedback Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Neutral Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // Gray Scale
  static const Color grey50 = Color(0xFFF8F9FA);
  static const Color grey100 = Color(0xFFF0F0F0);
  static const Color grey200 = Color(0xFFE0E0E0);
  static const Color grey300 = Color(0xFFCCCCCC);
  static const Color grey400 = Color(0xFF999999);
  static const Color grey500 = Color(0xFF666666);
  static const Color grey600 = Color(0xFF4A4A4A);
  static const Color grey700 = Color(0xFF2A2A2A);
  static const Color grey800 = Color(0xFF1A1A1A);
  static const Color grey900 = Color(0xFF0A0A0A);

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textDisabled = Color(0xFF999999);
  static const Color textOnDark = Color(0xFFFFFFFF);

  // Background
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1A1A1A);

  // Overlay
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);

  // Podium Colors
  static const Color gold = Color(0xFFFFD700);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color bronze = Color(0xFFCD7F32);

  F1SemanticColors._();
}

class F1TeamColors {
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color onPrimary;

  const F1TeamColors({
    required this.primary,
    required this.secondary,
    required this.accent,
    this.onPrimary = F1SemanticColors.white,
  });

  static const F1TeamColors mclaren = F1TeamColors(
    primary: Color.fromARGB(255, 248, 105, 10), // Papaya Orange
    secondary: Color.fromARGB(255, 255, 184, 77), // Light Orange
    accent: Color(0xFF1A1A1A),
    onPrimary: F1SemanticColors.black, // Black
  );

  static const F1TeamColors redBull = F1TeamColors(
    primary: Color.fromARGB(255, 5, 0, 139), // Royal Blue
    secondary: Color.fromARGB(255, 58, 53, 202),
    accent: Color(0xFFDC0000), // Red
  );

  static const F1TeamColors ferrari = F1TeamColors(
    primary: Color(0xFFDC0000), // Rosso Corsa
    secondary: Color.fromARGB(255, 247, 103, 103), // Gold
    accent: Color(0xFF1A1A1A), // Black
  );

  static const F1TeamColors mercedes = F1TeamColors(
    primary: Color(0xFF00D2BE), // Petronas Turquoise
    secondary: Color.fromARGB(255, 157, 245, 236), // Silver
    accent: Color(0xFF1A1A1A), // Black
    onPrimary: F1SemanticColors.black, // Black text
  );

  static const F1TeamColors astonMartin = F1TeamColors(
    primary: Color(0xFF006F62), // British Racing Green
    secondary: Color(0xFF00E5B8), // Lime Green
    accent: Color(0xFFFFB6C1), // Pink
  );

  static const F1TeamColors alpine = F1TeamColors(
    primary: Color(0xFF0090FF), // Alpine Blue
    secondary: Color(0xFFFF1E8D), // BWT Pink
    accent: Color(0xFFDC0000), // Red
  );

  static const F1TeamColors williams = F1TeamColors(
    primary: Color(0xFF005AFF), // Williams Blue
    secondary: Color(0xFF00A0DE), // Light Blue
    accent: Color(0xFFDC0000), // Red
  );

  static const F1TeamColors haas = F1TeamColors(
    primary: Color(0xFFB6BABD), // Silver
    secondary: Color(0xFFDC0000), // Red
    accent: Color(0xFF1A1A1A), // Black
    onPrimary: F1SemanticColors.black, // Black text
  );

  static const F1TeamColors rb = F1TeamColors(
    primary: Color(0xFF2B4562), // Navy Blue
    secondary: Color(0xFF4169E1), // Royal Blue
    accent: Color(0xFFDC0000), // Red
  );

  static const F1TeamColors sauber = F1TeamColors(
    primary: Color(0xFF00E701), // Stake Green
    secondary: Color.fromARGB(255, 138, 226, 138), // Black
    accent: Color(0xFFDC0000), // Red
    onPrimary: F1SemanticColors.black, // Black text
  );
}

class F1Theme {
  final F1TeamColors team;

  // Couleurs sémantiques (communes)
  final Color success = F1SemanticColors.success;
  final Color error = F1SemanticColors.error;
  final Color warning = F1SemanticColors.warning;
  final Color info = F1SemanticColors.info;

  final Color black = F1SemanticColors.black;
  final Color white = F1SemanticColors.white;

  final Color grey50 = F1SemanticColors.grey50;
  final Color grey100 = F1SemanticColors.grey100;
  final Color grey200 = F1SemanticColors.grey200;
  final Color grey300 = F1SemanticColors.grey300;
  final Color grey400 = F1SemanticColors.grey400;
  final Color grey500 = F1SemanticColors.grey500;
  final Color grey600 = F1SemanticColors.grey600;
  final Color grey700 = F1SemanticColors.grey700;
  final Color grey800 = F1SemanticColors.grey800;
  final Color grey900 = F1SemanticColors.grey900;

  final Color textPrimary = F1SemanticColors.textPrimary;
  final Color textSecondary = F1SemanticColors.textSecondary;
  final Color textDisabled = F1SemanticColors.textDisabled;
  final Color textOnDark = F1SemanticColors.textOnDark;

  final Color background = F1SemanticColors.background;
  final Color surface = F1SemanticColors.surface;
  final Color surfaceDark = F1SemanticColors.surfaceDark;

  final Color overlay = F1SemanticColors.overlay;
  final Color overlayLight = F1SemanticColors.overlayLight;

  final Color gold = F1SemanticColors.gold;
  final Color silver = F1SemanticColors.silver;
  final Color bronze = F1SemanticColors.bronze;

  // Couleurs d'équipe (dynamiques)
  Color get primary => team.primary;
  Color get secondary => team.secondary;
  Color get accent => team.accent;
  Color get onPrimary => team.onPrimary;

  const F1Theme({required this.team});

  static const F1Theme mclaren = F1Theme(team: F1TeamColors.mclaren);
  static const F1Theme redBull = F1Theme(team: F1TeamColors.redBull);
  static const F1Theme ferrari = F1Theme(team: F1TeamColors.ferrari);
  static const F1Theme mercedes = F1Theme(team: F1TeamColors.mercedes);
  static const F1Theme astonMartin = F1Theme(team: F1TeamColors.astonMartin);
  static const F1Theme alpine = F1Theme(team: F1TeamColors.alpine);
  static const F1Theme williams = F1Theme(team: F1TeamColors.williams);
  static const F1Theme haas = F1Theme(team: F1TeamColors.haas);
  static const F1Theme rb = F1Theme(team: F1TeamColors.rb);
  static const F1Theme sauber = F1Theme(team: F1TeamColors.sauber);

  static const List<F1Theme> allThemes = [
    mclaren,
    redBull,
    ferrari,
    mercedes,
    astonMartin,
    alpine,
    williams,
    haas,
    rb,
    sauber,
  ];

  static const Map<F1Theme, String> teamNames = {
    mclaren: 'McLaren F1 Team',
    redBull: 'Red Bull Racing',
    ferrari: 'Scuderia Ferrari',
    mercedes: 'Mercedes-AMG Petronas',
    astonMartin: 'Aston Martin F1 Team',
    alpine: 'BWT Alpine F1 Team',
    williams: 'Williams Racing',
    haas: 'MoneyGram Haas F1 Team',
    rb: 'Visa Cash App RB',
    sauber: 'Stake F1 Team',
  };
}

class F1ThemeProvider extends InheritedWidget {
  final F1Theme theme;

  const F1ThemeProvider({super.key, required this.theme, required super.child});

  static F1Theme of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<F1ThemeProvider>();
    assert(provider != null, 'No F1ThemeProvider found in context');
    return provider!.theme;
  }

  @override
  bool updateShouldNotify(F1ThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}

// ============================================
// EXTENSION POUR ACCÈS FACILE AU THÈME
// ============================================

/// Extension pour accéder facilement au thème depuis le BuildContext
extension F1ThemeContext on BuildContext {
  /// Accès rapide au thème F1 complet
  F1Theme get f1Theme => F1ThemeProvider.of(this);

  /// Accès rapide aux couleurs d'équipe
  F1TeamColors get teamColors => f1Theme.team;

  /// Couleur primaire du thème actuel
  Color get primaryColor => f1Theme.primary;

  /// Couleur secondaire du thème actuel
  Color get secondaryColor => f1Theme.secondary;

  /// Couleur d'accent du thème actuel
  Color get accentColor => f1Theme.accent;
}
