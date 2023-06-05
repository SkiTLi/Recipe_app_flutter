import 'package:flutter/material.dart';

class ThemeColors {
  static const scaffold = Color(0xFFFFFFFF);
  static const dark = Color(0xFF000000);
  static const grey = Color(0xFF999999);
  static const greyLight = Color(0xFFF6F6F6);
  static const primaryDark = Color(0xFFEB7E4B);
  static const primary = Color(0xFFfC8B56);
  static const primaryAdditional = Color(0xAAfC8B56);
  static const primaryLight = Color(0xFFFFF4E4);
  static const fadedText = Color(0xFFAFAFAF);
  static const error = Color(0xffd52a2a);
  static const light = Color(0xffFCBD56);

  // static Color text = Colors.white.withOpacity(.87);
// the same
  static const text = Color(0xDDFFFFFF);
}

class ThemeFonts {
  static const r9 = TextStyle(
    fontSize: 9,
    color: ThemeColors.text,
    height: 1.5,
  ); //regular, size9

  static const rb9 = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: ThemeColors.dark,
    height: 1.5,
  );

  static const rp10 = TextStyle(
    fontSize: 10,
    color: ThemeColors.primary,
    height: 1.5,
  );

  static const rg10 = TextStyle(
    fontSize: 10,
    color: ThemeColors.grey,
    height: 1.5,
  );

  static const r12 = TextStyle(
    fontSize: 12,
    color: ThemeColors.text,
    height: 1.5,
  ); //regular, size12

  static const rb12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ThemeColors.dark,
    height: 1.5,
  );
  static const rp12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ThemeColors.primary,
    height: 1.5,
  );

  static const r14 = TextStyle(
    fontSize: 14,
    color: ThemeColors.text,
    height: 1.5,
  );

  static const bp14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: ThemeColors.primary,
    height: 1.5,
  );

  static const rg14 = TextStyle(
    fontSize: 14,
    color: ThemeColors.grey,
    height: 1.5,
  );

  static const rb14 = TextStyle(
    fontSize: 14,
    color: ThemeColors.dark,
    height: 1.5,
  );

  static const r15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: ThemeColors.text,
    height: 1.5,
  );

  static const rp15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: ThemeColors.primary,
    height: 1.5,
  );

  static const r16 = TextStyle(
    fontSize: 16,
    color: ThemeColors.text,
    height: 1.5,
  );

  static const r18 = TextStyle(
    fontSize: 18,
    color: ThemeColors.text,
    height: 1.5,
  );

  static const bb18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ThemeColors.dark,
    height: 1.5,
  );

  static const r20 = TextStyle(
    fontSize: 20,
    color: ThemeColors.text,
    height: 1.5,
  );
}
