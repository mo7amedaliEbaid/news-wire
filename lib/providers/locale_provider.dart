/*
import 'package:flutter/material.dart';
import 'package:inform_me/utils/app_utils.dart';

import '../models/language_model.dart';

class LocaleProvider extends ChangeNotifier {
  bool isenglish = true;

  Locale locale = Locale('en', "US");
  changelan_status(){
    isenglish=!isenglish;
  }

  updateLocale(Locale a) {
    locale = a;
    notifyListeners();
  }

  Locale changeLanguage(Language language, context) {
    Locale _a;
    switch (language.languageCode) {
      case AppUtils.ENGLISH:
        _a = Locale(language.languageCode, "US");
        break;
      case AppUtils.Arabic:
        _a = Locale(language.languageCode, "EG");
        break;

      default:
        _a = Locale(language.languageCode, 'US');
    }
    notifyListeners();
    return _a;
  }
}
*/
