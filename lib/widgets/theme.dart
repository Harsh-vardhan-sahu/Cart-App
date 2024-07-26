import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme{
  static ThemeData lightTheme(BuildContext context)=> ThemeData(

        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),

        ), // primaryTextTheme:GoogleFonts.latoTextTheme()
 );
  static ThemeData darkTheme(BuildContext context)=> ThemeData(

    brightness: Brightness.dark,

     // primaryTextTheme:GoogleFonts.latoTextTheme()
  );
  static Color creamColor=Color(0xff5f5f5f);
  static Color darkBluishColor=Color(0xff403b58);
  }