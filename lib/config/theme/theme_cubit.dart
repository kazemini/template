import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:template/core/database/shared_preferences_db.dart';

import '../utils/constants_config.dart';
import '../utils/enums_config.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(ConfigConstants.defaultTheme));

  void lightMode() => emit(ThemeState(ThemeMode.light));

  void darkMode() => emit(ThemeState(ThemeMode.dark));

  void system() => emit(ThemeState(ThemeMode.system));

  void changeTheme({required ThemeMode themeMode}) => emit(ThemeState(themeMode));
}
