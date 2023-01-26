import 'package:flutter/material.dart';

const primaryColor = Color(0xFF3cbd96);
const primaryColorLight = Color(0xFFecf8f5);

const secondaryColor = Color(0xFFb2dfdb);

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
          headline2: base.textTheme.headline6?.copyWith(color: primaryColor)),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
    );
  }
}
