import 'package:flutter/material.dart';
import 'package:haumsung_web/utils/text_style.dart';
import 'color.dart';

class AppTheme {
  AppTheme._();

  static final TextTheme _regularTextTheme = TextTheme(
      headline1: headline1,
      headline2: headline2,
      headline3: headline3,
      headline4: headline4,
      headline5: headline4,
      headline6: headline4,
      subtitle1: subtitle1,
      subtitle2: subtitle2,
      bodyText1: body1,
      bodyText2: body2,
      button: button,
      caption: caption1,
      overline: caption2);

  static final ColorScheme _colorScheme = ColorScheme(
      primary: primaryColor,
      primaryVariant: primaryColor,
      secondary: secondaryColor,
      secondaryVariant: secondaryColor,
      surface: surfaceColor,
      background: backgroundColor,
      error: errorColor,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onSurface: onSurfaceColor,
      onBackground: onBackgroundColor,
      onError: onErrorColor,
      brightness: Brightness.light);

  static final ThemeData regularTheme = ThemeData(
      colorScheme: _colorScheme,
      textTheme: _regularTextTheme,
      highlightColor: Colors.transparent,
  );
}
