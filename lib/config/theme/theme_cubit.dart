import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:template/config/theme/app_theme.dart';

import '../../core/utils/enums.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super( ThemeState(ThemeMode.light));

  void lightMode() => emit(ThemeState(ThemeMode.light));

  void darkMode() => emit(ThemeState(ThemeMode.dark));

  void system() => emit(ThemeState(ThemeMode.system));
}
