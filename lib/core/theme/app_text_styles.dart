import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized text styles using Inter font family via google_fonts
class AppTextStyles {
  AppTextStyles._();

  // ─── Display ─────────────────────────────────────────────────────────────────
  static TextStyle get displayLarge => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.25,
          height: 1.12,
        ),
      );

  static TextStyle get displayMedium => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          height: 1.16,
        ),
      );

  // ─── Headline ────────────────────────────────────────────────────────────────
  static TextStyle get headlineLarge => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          height: 1.25,
        ),
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.29,
        ),
      );

  static TextStyle get headlineSmall => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.33,
        ),
      );

  // ─── Title ───────────────────────────────────────────────────────────────────
  static TextStyle get titleLarge => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.27,
        ),
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          height: 1.5,
        ),
      );

  static TextStyle get titleSmall => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          height: 1.43,
        ),
      );

  // ─── Body ────────────────────────────────────────────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.5,
        ),
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 1.43,
        ),
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.33,
        ),
      );

  // ─── Label ───────────────────────────────────────────────────────────────────
  static TextStyle get labelLarge => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
        ),
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.33,
        ),
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.45,
        ),
      );
}
