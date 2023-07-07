import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int currentIndex = 0;

  int get index => currentIndex;

  set index(int value) {
    currentIndex = value;

    notifyListeners();
  }
}
