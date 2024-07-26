import 'package:flutter/material.dart';
import 'package:flutternew/Pages/homepage.dart';
import 'package:flutternew/Pages/loginPage.dart';
import 'package:flutternew/utils/routes.dart';
import 'package:flutternew/widgets/theme.dart';
import "package:google_fonts/google_fonts.dart";
void main() {
  runApp(Myapp());
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home:homepage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),

      debugShowCheckedModeBanner: false,
      darkTheme:MyTheme.darkTheme(context),
      routes: {
        "/":(context) => HomePage(),
        MyRoutes.loginRoute:(context) => loginPage(),
        MyRoutes.homeRoute:(context) => HomePage()

      },
    );
  }


}

