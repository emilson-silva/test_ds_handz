import 'package:flutter/material.dart';

class DSTypography {
  static TextTheme textTheme(Color primary, Color secondary) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: primary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondary,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: secondary,
      ),
    );
  }
}
