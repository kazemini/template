import 'package:flutter/material.dart';



import '../utils/enums.dart';


class SharedPreferencesDB {
  static const String _theme = 'theme';
/*
  //? save Theme mode into db
  static Future setThemeMode(ThemeEnum themeEnum) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_theme,themeEnum.index);
  }

  //? get theme from db, if is null => light mode
 static Future<int> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_theme) ?? 0;
  }

* */
}