import 'package:amora_mobile_app/utils/theme/custom_themes/elevated_button.dart';
import 'package:amora_mobile_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: const Color(0xFFFF496B),
      dividerColor: const Color(0xFF989394),
      canvasColor: const Color(0xFFFFE9F1),
      scaffoldBackgroundColor: Colors.white,
      textTheme: CustomTextTheme.lightTextTheme,
      elevatedButtonTheme: CustomElevatedButton.lightElevatedButtonTheme);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
  );
}
