import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Use M4 Group Brand Colors
  static const Color primaryGold = Color(0xFFD4AF37);
  static const Color secondaryGold = Color(0xFFC5A028);
  static const Color charcoal = Color(0xFF1A1A1A);
  static const Color darkGrey = Color(0xFF2C2C2C);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: charcoal,
      scaffoldBackgroundColor: white,
      colorScheme: const ColorScheme.light(
        primary: charcoal,
        secondary: primaryGold,
        surface: white,
        onSurface: charcoal,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge:
            GoogleFonts.poppins(fontWeight: FontWeight.bold, color: charcoal),
        titleLarge:
            GoogleFonts.poppins(fontWeight: FontWeight.w600, color: charcoal),
        bodyLarge: GoogleFonts.poppins(color: charcoal),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: charcoal),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryGold,
      scaffoldBackgroundColor: black,
      colorScheme: const ColorScheme.dark(
        primary: primaryGold,
        secondary: primaryGold,
        surface: charcoal,
        onSurface: white,
      ),
      textTheme:
          GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge:
            GoogleFonts.poppins(fontWeight: FontWeight.bold, color: white),
        titleLarge:
            GoogleFonts.poppins(fontWeight: FontWeight.w600, color: white),
        bodyLarge: GoogleFonts.poppins(color: Colors.white70),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: black,
        elevation: 0,
        iconTheme: IconThemeData(color: white),
      ),
    );
  }
}
