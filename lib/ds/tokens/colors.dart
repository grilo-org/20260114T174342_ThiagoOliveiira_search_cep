import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final TealColors teal;
  final NeutralColors neutral;
  final AquaColors aqua;
  final FeedbackColors feedback;

  const AppColorScheme({required this.teal, required this.neutral, required this.aqua, required this.feedback});

  factory AppColorScheme.light() {
    return AppColorScheme(teal: TealColors.light(), neutral: NeutralColors.light(), aqua: AquaColors.light(), feedback: FeedbackColors.light());
  }

  factory AppColorScheme.dark() {
    return AppColorScheme(teal: TealColors.dark(), neutral: NeutralColors.dark(), aqua: AquaColors.dark(), feedback: FeedbackColors.dark());
  }

  @override
  AppColorScheme copyWith({TealColors? teal, NeutralColors? neutral, AquaColors? aqua, FeedbackColors? feedback}) {
    return AppColorScheme(teal: teal ?? this.teal, neutral: neutral ?? this.neutral, aqua: aqua ?? this.aqua, feedback: feedback ?? this.feedback);
  }

  @override
  ThemeExtension<AppColorScheme> lerp(covariant ThemeExtension<AppColorScheme>? other, double t) => this;
}

class TealColors {
  final Color darker;
  final Color dark;
  final Color steel;
  final Color mist;
  final Color silver;
  final Color slate;

  const TealColors._internal({required this.darker, required this.dark, required this.steel, required this.mist, required this.silver, required this.slate});

  factory TealColors.light() {
    return const TealColors._internal(darker: Color(0xFF0B3F47), dark: Color(0xFF145A66), steel: Color(0xFF2A6F79), mist: Color(0xFFEAF6F7), silver: Color(0xFFB7D4D7), slate: Color(0xFF0A2F35));
  }

  factory TealColors.dark() {
    return const TealColors._internal(darker: Color(0xFF081F23), dark: Color(0xFF0F4C55), steel: Color(0xFF7DB6BD), mist: Color(0xFF0C171B), silver: Color(0xFF2A3A3F), slate: Color(0xFF13363C));
  }
}

class NeutralColors {
  final Color deepOcean;
  final Color white;
  final Color frostWhite;
  final Color utilityGray;
  final Color lightGray;
  final Color lighterGray;
  final Color darkGray;

  const NeutralColors._internal({required this.deepOcean, required this.white, required this.frostWhite, required this.utilityGray, required this.lightGray, required this.lighterGray, required this.darkGray});

  factory NeutralColors.light() {
    return const NeutralColors._internal(
      deepOcean: Color(0xFF102428),
      white: Color(0xFFFFFFFF),
      frostWhite: Color(0xFFF2F6F7),
      utilityGray: Color(0xFF5D6B70),
      lightGray: Color(0xFFE6EEF0),
      lighterGray: Color(0xFFD6E3E5),
      darkGray: Color(0xFF2E3B3F),
    );
  }

  factory NeutralColors.dark() {
    return const NeutralColors._internal(
      deepOcean: Color(0xFFE6EEF0),
      white: Color(0xFFE6EEF0),
      frostWhite: Color(0xFF122127),
      utilityGray: Color(0xFF9BB0B5),
      lighterGray: Color(0xFF1E2B30),
      lightGray: Color(0xFF0C171B),
      darkGray: Color(0xFF3D4A4F),
    );
  }
}

class AquaColors {
  final Color primary;
  final Color dark;
  final Color tint;
  final Color pale;

  const AquaColors._internal({required this.primary, required this.dark, required this.tint, required this.pale});

  factory AquaColors.light() {
    return const AquaColors._internal(primary: Color(0xFF18A7AE), dark: Color(0xFF0F7980), tint: Color(0xFFC7EDF0), pale: Color(0xFFEFFAFB));
  }

  factory AquaColors.dark() {
    return const AquaColors._internal(primary: Color(0xFF7ED8DD), dark: Color(0xFF27AEB4), tint: Color(0xFF13484D), pale: Color(0xFF0E2F33));
  }
}

extension AppColorSchemeX on BuildContext {
  AppColorScheme get tokens => Theme.of(this).extension<AppColorScheme>()!;
}

class FeedbackColors {
  final Color error;
  final Color errorBackground;
  final Color warning;
  final Color success;
  final Color info;

  const FeedbackColors._internal({required this.error, required this.errorBackground, required this.warning, required this.success, required this.info});

  factory FeedbackColors.light() {
    return const FeedbackColors._internal(error: Color(0xFFD32F2F), errorBackground: Color(0xFFFDECEA), warning: Color(0xFFF57C00), success: Color(0xFF388E3C), info: Color(0xFF1976D2));
  }

  factory FeedbackColors.dark() {
    return const FeedbackColors._internal(error: Color(0xFFEF9A9A), errorBackground: Color(0xFF3B0D0C), warning: Color(0xFFFFB74D), success: Color(0xFF81C784), info: Color(0xFF64B5F6));
  }
}
