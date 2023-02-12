import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';


class AppTheme {

  get lightTheme => ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: Constants.colorScheme,
    useMaterial3: Constants.isMaterial3,
    fontFamily: Constants.fontFamily
  );

  get darkTheme => ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: Constants.colorScheme,
      useMaterial3: Constants.isMaterial3,
      fontFamily: Constants.fontFamily
  );
}