import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

ThemeData buildDarkTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  final tokens = AppColorScheme.dark();

  return base.copyWith(
    extensions: [tokens, AppFontStyle(), AppSpacing.app()],

    scaffoldBackgroundColor: tokens.neutral.lightGray,

    colorScheme: base.colorScheme.copyWith(
      primary: tokens.teal.dark,
      secondary: tokens.aqua.primary,
      surface: tokens.teal.mist,
      error: tokens.feedback.error,
      onSurface: tokens.neutral.deepOcean,
      onPrimary: tokens.neutral.white,
      onSecondary: tokens.neutral.white,
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: tokens.teal.mist,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

      hintStyle: TextStyle(color: tokens.neutral.utilityGray),
      labelStyle: TextStyle(color: tokens.neutral.utilityGray),
      helperStyle: TextStyle(color: tokens.neutral.utilityGray),
      errorStyle: TextStyle(color: tokens.feedback.error),

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: tokens.neutral.utilityGray)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: tokens.neutral.utilityGray)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: tokens.aqua.primary, width: 1.6)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: tokens.feedback.error)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: tokens.feedback.error, width: 1.6)),
      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: tokens.neutral.darkGray.withValues(alpha: .4))),

      prefixIconColor: tokens.teal.steel,
      suffixIconColor: tokens.teal.steel,
      iconColor: tokens.teal.steel,
    ),

    textSelectionTheme: TextSelectionThemeData(cursorColor: tokens.aqua.primary, selectionColor: tokens.aqua.tint.withValues(alpha: .5), selectionHandleColor: tokens.aqua.primary),

    appBarTheme: AppBarTheme(backgroundColor: tokens.teal.mist, foregroundColor: tokens.neutral.deepOcean, elevation: 0, surfaceTintColor: Colors.transparent),
    cardTheme: const CardTheme(surfaceTintColor: Colors.transparent),
    dialogTheme: const DialogTheme(surfaceTintColor: Colors.transparent),
    bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.transparent),
    drawerTheme: const DrawerThemeData(surfaceTintColor: Colors.transparent),
    snackBarTheme: SnackBarThemeData(backgroundColor: tokens.teal.slate, contentTextStyle: TextStyle(color: tokens.neutral.white), actionTextColor: tokens.aqua.primary, behavior: SnackBarBehavior.floating),
    dividerTheme: DividerThemeData(color: tokens.neutral.lighterGray),
    iconTheme: IconThemeData(color: tokens.teal.steel),

    applyElevationOverlayColor: false,
  );
}
