import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  CustomTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // Headline Medium
    headlineMedium: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),

    // Headline Large
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),

    // Body Small
    bodySmall: const TextStyle()
        .copyWith(fontSize: 13, color: const Color(0xFF989394)),

    // Body Medium
    bodyMedium: const TextStyle().copyWith(fontSize: 16, color: Colors.black),

    // Display Medium
    displayMedium: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: const Color(0xFF555555),
        height: 1.4,
        wordSpacing: 2.0),

    // Label Large
    labelMedium: GoogleFonts.playfairDisplay()
        .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
  );

  // Dark Theme
  static TextTheme darkTextTheme = const TextTheme();
}
