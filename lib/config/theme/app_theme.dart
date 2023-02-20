import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class AppTheme {
  static get lightTheme => ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: CoreConstants.colorScheme,
      useMaterial3: CoreConstants.isMaterial3,
      fontFamily: CoreConstants.fontFamily);

  static get darkTheme => ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: CoreConstants.colorScheme,
      useMaterial3: CoreConstants.isMaterial3,
      fontFamily: CoreConstants.fontFamily);
}
