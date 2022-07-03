import 'package:dark_theme/services/storage_service.dart';
import 'package:flutter/material.dart';

/// Value notifier to switch between light and dark theme modes
ValueNotifier<ThemeMode> darkThemeOn = ValueNotifier(ThemeMode.system);

ThemeData getThemeData() =>
    ThemeData(appBarTheme: const AppBarTheme(color: Colors.blue));

/// Dark and Light theme mode switch button
class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: darkThemeOn,
        builder: (context, value, w) {
          if (darkThemeOn.value == ThemeMode.dark) {
            return IconButton(
                icon: const Icon(Icons.wb_sunny_outlined),
                onPressed: () {
                  darkThemeOn.value = ThemeMode.light;
                  StorageService.setThemeMode('notDark');
                });
          } else {
            return IconButton(
              icon: const Icon(Icons.nightlight_round),
              onPressed: () {
                darkThemeOn.value = ThemeMode.dark;
                StorageService.setThemeMode('isDark');
              },
            );
          }
        });
  }
}
