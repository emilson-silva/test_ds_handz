import 'package:flutter/material.dart';

@immutable
class DSTheme extends ThemeExtension<DSTheme> {
  const DSTheme({
    required this.brandPrimary,
    required this.brandSecondary,
    required this.onBrand,
    required this.background,
    required this.surface,
    required this.onSurface,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.focus,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.disabled,
    required this.onDisabled,
    required this.radiusSm,
    required this.radiusMd,
    required this.radiusLg,
    required this.radiusPill,
  });

  final Color brandPrimary;
  final Color brandSecondary;
  final Color onBrand;
  final Color background;
  final Color surface;
  final Color onSurface;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color focus;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color disabled;
  final Color onDisabled;
  final double radiusSm;
  final double radiusMd;
  final double radiusLg;
  final double radiusPill;

  @override
  DSTheme copyWith({
    Color? brandPrimary,
    Color? brandSecondary,
    Color? onBrand,
    Color? background,
    Color? surface,
    Color? onSurface,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? focus,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? disabled,
    Color? onDisabled,
    double? radiusSm,
    double? radiusMd,
    double? radiusLg,
    double? radiusPill,
  }) {
    return DSTheme(
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      onBrand: onBrand ?? this.onBrand,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
      focus: focus ?? this.focus,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      disabled: disabled ?? this.disabled,
      onDisabled: onDisabled ?? this.onDisabled,
      radiusSm: radiusSm ?? this.radiusSm,
      radiusMd: radiusMd ?? this.radiusMd,
      radiusLg: radiusLg ?? this.radiusLg,
      radiusPill: radiusPill ?? this.radiusPill,
    );
  }

  @override
  DSTheme lerp(ThemeExtension<DSTheme>? other, double t) {
    if (other is! DSTheme) {
      return this;
    }

    return DSTheme(
      brandPrimary:
          Color.lerp(brandPrimary, other.brandPrimary, t) ?? brandPrimary,
      brandSecondary:
          Color.lerp(brandSecondary, other.brandSecondary, t) ?? brandSecondary,
      onBrand: Color.lerp(onBrand, other.onBrand, t) ?? onBrand,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? onSurface,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      border: Color.lerp(border, other.border, t) ?? border,
      focus: Color.lerp(focus, other.focus, t) ?? focus,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      error: Color.lerp(error, other.error, t) ?? error,
      info: Color.lerp(info, other.info, t) ?? info,
      disabled: Color.lerp(disabled, other.disabled, t) ?? disabled,
      onDisabled: Color.lerp(onDisabled, other.onDisabled, t) ?? onDisabled,
      radiusSm: radiusSm + (other.radiusSm - radiusSm) * t,
      radiusMd: radiusMd + (other.radiusMd - radiusMd) * t,
      radiusLg: radiusLg + (other.radiusLg - radiusLg) * t,
      radiusPill: radiusPill + (other.radiusPill - radiusPill) * t,
    );
  }
}

extension DSThemeX on BuildContext {
  DSTheme get dsTheme => Theme.of(this).extension<DSTheme>()!;
}
