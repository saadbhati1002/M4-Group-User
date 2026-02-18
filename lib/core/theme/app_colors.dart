import 'package:flutter/material.dart';

/// Centralized color palette for M4 Group app
class AppColors {
  AppColors._();

  // ─── Brand Colors ────────────────────────────────────────────────────────────
  static const Color primaryLight = Color(0xFF4A9EFF);

  // Brand Colors
  static const Color primary = Color(0xFF022FFD); // Travoo Primary Blue
  static const Color secondary = Color(0xFF00C2FF); // Travoo Secondary Cyan
  static const Color accent = Color(0xFF234AF6); // Primary Hover/Accent

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Neutral Colors (Light)
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF9FAFB);
  static const Color textPrimaryLight = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF4B5563);
  static const Color borderLight = Color(0xFFE5E7EB);

  // Neutral Colors (Dark)
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color borderDark = Color(0xFF334155);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    primary,
    secondary,
  ];

  static const List<Color> splashGradient = [
    Color(0xFF022FFD),
    Color(0xFF00C2FF),
  ];

  // Aliases for compatibility
  static const Color lightBackground = backgroundLight;
  static const Color lightSurface = surfaceLight;
  static const Color lightSurfaceVariant = Color(0xFFF0F4FF);
  static const Color lightOnBackground = textPrimaryLight;
  static const Color lightOnSurface = textPrimaryLight;
  static const Color lightOnSurfaceVariant = textSecondaryLight;
  static const Color lightDivider = borderLight;
  static const Color lightShadow = Color(0x1A000000);

  static const Color darkBackground = backgroundDark;
  static const Color darkSurface = surfaceDark;
  static const Color darkSurfaceVariant = Color(0xFF1E2A3A);
  static const Color darkOnBackground = textPrimaryDark;
  static const Color darkOnSurface = textPrimaryDark;
  static const Color darkOnSurfaceVariant = textSecondaryDark;
  static const Color darkDivider = borderDark;
  static const Color darkShadow = Color(0x40000000);

  static const List<Color> splashGradientLight = splashGradient;
  static const List<Color> splashGradientDark = splashGradient;

  static const List<Color> shimmerColors = [
    Color(0xFFE2E8F0),
    Color(0xFFF8FAFF),
    Color(0xFFE2E8F0),
  ];

  static const List<Color> shimmerColorsDark = [
    Color(0xFF1E2A3A),
    Color(0xFF2D3748),
    Color(0xFF1E2A3A),
  ];
}
