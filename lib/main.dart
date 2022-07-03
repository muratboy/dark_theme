import 'package:dark_theme/services/storage_service.dart';
import 'package:dark_theme/views/home.dart';
import 'package:dark_theme/views/theme_button.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService.initThemeMode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: darkThemeOn,
        builder: (context, value, w) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'dark theme',
            themeMode: darkThemeOn.value,
            darkTheme: ThemeData.dark(),
            theme: getThemeData(),
            home: const MyHomePage(title: 'theme change'),
          );
        });
  }
}
