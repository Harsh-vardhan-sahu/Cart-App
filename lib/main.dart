import 'package:flutter/material.dart';
import 'package:flutternew/core/store.dart';
import 'package:flutternew/utils/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/homepage.dart';
import 'utils/routes.dart';
import 'Pages/cart_page.dart';
import 'Pages/loginPage.dart';
import 'Pages/otpPage.dart';
import 'widgets/theme.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp(),
  ));
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
              MyRoutes.loginRoute: (context) => LoginPage(),
              MyRoutes.homeRoute: (context) => HomePage(),
              MyRoutes.cartRoute: (context) => CartPage(),
              MyRoutes.otpRoute: (context) => OtpPage(),
            },
          );
        },
      ),
    );
  }
}
