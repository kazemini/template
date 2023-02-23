import 'package:flutter/material.dart';

import '../utils/constants_config.dart';

class AppTheme {
  static get lightTheme => ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: ConfigConstants.colorScheme,
      useMaterial3: ConfigConstants.isMaterial3,
      fontFamily: ConfigConstants.fontFamily);

  static get darkTheme => ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: ConfigConstants.colorScheme,
      useMaterial3: ConfigConstants.isMaterial3,
      fontFamily: ConfigConstants.fontFamily);
}
