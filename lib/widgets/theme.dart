import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    cardColor: Colors.white,
    canvasColor: creamColor,
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: ColorScheme.light(
      primary: darkBluishColor,
      secondary: darkBluishColor,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: darkBluishColor,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: ColorScheme.dark(
      primary: Colors.deepPurpleAccent,
      secondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: lighteBluishColor,
    ),
  );

  static const Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static const Color darkBluishColor = Color(0xff403b58);
  static Color lighteBluishColor = Vx.indigo500;
  static Color dark=Vx.black;
}
