import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const _local = "_local";

  static Future<bool> setLocal(Locale locale) async {
    final languageCode = locale.languageCode ?? 'en';
    final countryCode = locale.countryCode ?? 'US';

    try {
      await _sharedPreferences
          .setStringList(_local, [languageCode, countryCode]);
    } catch (e) {
      debugPrint("======================+++");
      debugPrint(e.toString());
    }
  }

  static Locale getLocal() {
    final localList = _sharedPreferences.getStringList(_local) ?? ['en', 'US'];
    return Locale(localList[0], localList[1]);
  }
}
