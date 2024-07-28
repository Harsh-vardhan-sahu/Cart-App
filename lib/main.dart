import 'package:flutter/material.dart';
import 'package:flutternew/utils/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'Pages/homepage.dart';
import 'utils/routes.dart';
import 'widgets/theme.dart';
import 'Pages/cart_page.dart';
import 'Pages/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            themeMode: ThemeMode.system,
            theme: themeNotifier.getTheme(context),
            darkTheme: MyTheme.darkTheme(context),
            debugShowCheckedModeBanner: false,
            routes: {
              "/": (context) => HomePage(),
              MyRoutes.loginRoute: (context) => loginPage(),
              MyRoutes.homeRoute: (context) => HomePage(),
              MyRoutes.cartRoute: (context) => CartPage(),
            },
          );
        },
      ),
    );
  }
}
