import 'package:flutter/material.dart';

const primaryColor = Color(0xFF216853);
const primaryColorLight = Color(0xFFecf8f5);

const secondaryColor = Color(0xFFb2dfdb);
// const SecondaryColorLight = const Color(0xFFe5ffff);
// const SecondaryColorDark = const Color(0xFF82ada9);

// const Background = const Color(0xFFfffdf7);
const textColor = Color(0xFFffffff);

class CustomTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      buttonTheme: base.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: base.textTheme.copyWith(
        titleMedium: base.textTheme.titleMedium?.copyWith(color: textColor),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
    );
  }
}
