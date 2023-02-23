import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:template/core/database/shared_preferences_db.dart';

import '../utils/constants_config.dart';
import '../utils/enums_config.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(_getTheme()));

  void lightMode() => emit(ThemeState(ThemeMode.light));

  void darkMode() => emit(ThemeState(ThemeMode.dark));

  void system() => emit(ThemeState(ThemeMode.system));

  void changeTheme(ThemeMode themeMode) => emit(ThemeState(themeMode));
}

ThemeMode _getTheme() {
  int theme = SharedPreferencesDB.getThemeMode();
  switch (theme) {
    case 0:
      return ThemeMode.light;
    case 1:
      return ThemeMode.dark;
    case 2:
      return ThemeMode.system;
    default:
      return ThemeMode.light;
  }
}

