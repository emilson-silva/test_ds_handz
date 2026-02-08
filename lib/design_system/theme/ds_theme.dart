import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/typography_tokens.dart';
import 'ds_theme_extension.dart';

enum DSBrand { more, moreAlt }

class DSThemeData {
  static ThemeData light(DSBrand brand) {
    final tokens = _tokensForBrand(brand);

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: tokens.background,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: tokens.brandPrimary,
            brightness: Brightness.light,
          ).copyWith(
            primary: tokens.brandPrimary,
            secondary: tokens.brandSecondary,
            surface: tokens.surface,
            error: tokens.error,
            onPrimary: tokens.onBrand,
            onSecondary: tokens.onBrand,
            onSurface: tokens.onSurface,
            onError: tokens.onBrand,
          ),
      textTheme: DSTypography.textTheme(
        tokens.textPrimary,
        tokens.textSecondary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: tokens.brandSecondary,
        foregroundColor: tokens.onBrand,
        surfaceTintColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: tokens.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(tokens.radiusMd),
          borderSide: BorderSide(color: tokens.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(tokens.radiusMd),
          borderSide: BorderSide(color: tokens.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(tokens.radiusMd),
          borderSide: BorderSide(color: tokens.focus, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(tokens.radiusMd),
          borderSide: BorderSide(color: tokens.error, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(tokens.radiusMd),
          borderSide: BorderSide(color: tokens.error, width: 2),
        ),
      ),
      extensions: [tokens],
    );
  }

  static DSTheme _tokensForBrand(DSBrand brand) {
    switch (brand) {
      case DSBrand.more:
        return DSTheme(
          brandPrimary: DSColorPalette.moreInk,
          brandSecondary: DSColorPalette.moreCoral,
          onBrand: DSColorPalette.white,
          background: DSColorPalette.moreSand,
          surface: DSColorPalette.surface,
          onSurface: DSColorPalette.moreInk,
          textPrimary: DSColorPalette.moreInk,
          textSecondary: DSColorPalette.moreSlate,
          border: DSColorPalette.border,
          focus: DSColorPalette.moreCoral,
          success: DSColorPalette.success,
          warning: DSColorPalette.warning,
          error: DSColorPalette.error,
          info: DSColorPalette.info,
          disabled: DSColorPalette.disabled,
          onDisabled: DSColorPalette.white,
          radiusSm: DSRadii.sm,
          radiusMd: DSRadii.md,
          radiusLg: DSRadii.lg,
          radiusPill: DSRadii.pill,
        );
      case DSBrand.moreAlt:
        return DSTheme(
          brandPrimary: DSColorPalette.moreSky,
          brandSecondary: DSColorPalette.moreSlate,
          onBrand: DSColorPalette.white,
          background: DSColorPalette.white,
          surface: DSColorPalette.surface,
          onSurface: DSColorPalette.moreInk,
          textPrimary: DSColorPalette.moreInk,
          textSecondary: DSColorPalette.moreSlate,
          border: DSColorPalette.border,
          focus: DSColorPalette.moreSky,
          success: DSColorPalette.success,
          warning: DSColorPalette.warning,
          error: DSColorPalette.error,
          info: DSColorPalette.info,
          disabled: DSColorPalette.disabled,
          onDisabled: DSColorPalette.white,
          radiusSm: DSRadii.sm,
          radiusMd: DSRadii.md,
          radiusLg: DSRadii.lg,
          radiusPill: DSRadii.pill,
        );
    }
  }
}
