import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  int categoryIndex = 0;

  set categoryIndexUpdate(int i) {
    categoryIndex = i;

    notifyListeners();
  }

  int get categoryIndexGet => categoryIndex;
}
