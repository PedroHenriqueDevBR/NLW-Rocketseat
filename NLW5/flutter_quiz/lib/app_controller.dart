import 'package:flutter/cupertino.dart';

class AppController {
  static AppController? _instance;
  AppController._();

  ValueNotifier<bool> isDark = ValueNotifier<bool>(false);
  bool get isDartOutput => isDark.value;
  void toggleThemeMode() {
    isDark.value = !isDark.value;
  }

  static get instance {
    _instance ??= AppController._();
    return _instance;
  }
}
