import 'package:dd_eportfolio/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeP(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeP>(context);
          return MaterialApp(
            theme: ThemeC.light,
            darkTheme: ThemeC.dark,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        },
      );
}

class ThemeC {
  static final light = ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: const Color(0xffe6e600),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xfff5f5f5),
      colorScheme: const ColorScheme.light());

  static final dark = ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: const Color(0xffe6e600),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff222222),
      colorScheme: const ColorScheme.dark());
}

class ThemeP extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
