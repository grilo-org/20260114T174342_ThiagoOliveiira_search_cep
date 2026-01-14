import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

extension AppThemeContext on BuildContext {
  AppColorScheme get colors => Theme.of(this).extension<AppColorScheme>()!;
  AppFontStyle get fontStyle => Theme.of(this).extension<AppFontStyle>()!;
  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;
}
