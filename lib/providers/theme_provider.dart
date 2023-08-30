import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  final cache = Hive.box('app');

  bool isDark = false;

  void init() {
    bool? cacheTheme = cache.get('theme');
    isDark = cacheTheme ?? false;
    log(cacheTheme.toString());
    notifyListeners();
  }

  bool get theme => isDark;

  set theme(bool value) {
    isDark = value;

    cache.put('theme', value);
    bool? cacheTheme = cache.get('theme');
    log(cacheTheme.toString());
    notifyListeners();
  }
}
