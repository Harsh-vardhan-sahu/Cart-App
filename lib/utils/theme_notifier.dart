import 'package:flutter/material.dart';
import '../widgets/theme.dart';
 // Ensure this import points to your theme file

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData getTheme(BuildContext context) {
    return _isDarkTheme ? MyTheme.darkTheme(context) : MyTheme.lightTheme(context);
  }

  void switchTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
