import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

abstract class CustomFontWeight {
  static const regular = FontWeight.w400;

  static const medium = FontWeight.w500;

  static const bold = FontWeight.w700;
}

abstract class CustomTypography {
  static const _fontName = 'Lato';

  static const display1 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 56,
    fontWeight: CustomFontWeight.medium,
    height: 1.5,
    letterSpacing: -.3,
  );

  static const display2 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 48,
    fontWeight: CustomFontWeight.medium,
    height: 1.2,
    letterSpacing: -.3,
  );

  static const headline1 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 40,
    fontWeight: CustomFontWeight.medium,
    height: 1.11,
    letterSpacing: -.2,
  );

  static const headline2 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 32,
    fontWeight: CustomFontWeight.medium,
    height: 1.33,
    letterSpacing: -.1,
  );

  static const headline3 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 24,
    fontWeight: CustomFontWeight.medium,
    height: 1.45,
    letterSpacing: 0,
  );

  static const title1 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 20,
    fontWeight: CustomFontWeight.bold,
    height: 1.45,
    letterSpacing: .3,
  );

  static const title2 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 18,
    fontWeight: CustomFontWeight.medium,
    height: 1.45,
    letterSpacing: .2,
  );

  static const title3 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 16,
    fontWeight: CustomFontWeight.medium,
    height: 1.5,
    letterSpacing: .1,
  );

  static const body1 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 18,
    fontWeight: CustomFontWeight.medium,
    height: 1.45,
    letterSpacing: 0,
  );

  static const body2 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 16,
    fontWeight: CustomFontWeight.regular,
    height: 1.5,
    letterSpacing: 0,
  );

  static const body3 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.primary,
    fontSize: 14,
    fontWeight: CustomFontWeight.regular,
    height: 1.71,
    letterSpacing: 0,
  );

  static const caption1 = TextStyle(
    fontFamily: _fontName,
    color: CustomColors.onPrimary,
    fontSize: 12,
    fontWeight: CustomFontWeight.regular,
    height: 1,
    letterSpacing: .1,
  );
}
