// ignore_for_file: use_key_in_widget_constructors

import 'screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'screens/culture_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
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
      primaryColor: Colors.blue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xfff5f5f5),
      colorScheme: const ColorScheme.light());

  static final dark = ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff222222),
      colorScheme: const ColorScheme.dark());
}

class ThemeP extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

Future<void> init() async {
  //Initialization Settings for Android
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/music');

  //Initialization Settings for iOS
  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );

  //InitializationSettings for initializing settings for both platforms
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}
