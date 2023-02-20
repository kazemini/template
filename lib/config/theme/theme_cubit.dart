import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'constants_config.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super( ThemeState(ConfigConstants.defaultTheme));

  void lightMode() => emit(ThemeState(ThemeMode.light));

  void darkMode() => emit(ThemeState(ThemeMode.dark));

  void system() => emit(ThemeState(ThemeMode.system));

  void changeTheme(ThemeMode themeMode) => emit(ThemeState(themeMode));
}
