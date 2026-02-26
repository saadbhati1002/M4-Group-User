import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Luxury Palette
  static const Color luxuryBlack = Color(0xFF0F0F0F);
  static const Color secondaryBlack = Color(0xFF181818);
  static const Color primaryGold = Color(0xFFD4AF37);
  static const Color softGrey = Color(0xFFCFCFCF);
  static const Color white = Colors.white;

  // Gold Gradients
  static const LinearGradient goldGradient = LinearGradient(
    colors: [
      Color(0xFFBF953F),
      Color(0xFFFCF6BA),
      Color(0xFFB38728),
      Color(0xFFFBF5B7),
      Color(0xFFAA771C)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get luxuryTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: luxuryBlack,
      primaryColor: primaryGold,
      colorScheme: const ColorScheme.dark(
        primary: primaryGold,
        secondary: primaryGold,
        surface: secondaryBlack,
        onSurface: white,
        onPrimary: luxuryBlack,
      ),
      textTheme:
          GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          color: white,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        titleLarge: GoogleFonts.poppins(
          color: primaryGold,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
        bodyLarge: GoogleFonts.poppins(color: softGrey),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryGold),
      ),
    );
  }

  // Skeuomorphic Shadow Decorators
  static BoxDecoration skeuomorphicDecoration({
    double radius = 22,
    Color color = secondaryBlack,
    bool isPressed = false,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: primaryGold.withValues(alpha: 0.25),
        width: 1,
      ),
      boxShadow: [
        // Light top shadow
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.04),
          offset: const Offset(-4, -4),
          blurRadius: 6,
        ),
        // Dark bottom shadow
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.6),
          offset: const Offset(4, 4),
          blurRadius: 8,
        ),
      ],
    );
  }
}
