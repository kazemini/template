import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:template/config/theme/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeEnum.light));

  void lightMode() => emit(const ThemeState(ThemeEnum.light));

  void darkMode() {
    return emit(const ThemeState(ThemeEnum.dark));
  }

  void system() => emit(const ThemeState(ThemeEnum.system));
}
