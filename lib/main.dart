import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/config/theme/theme_cubit.dart';
import 'package:template/config/utils/constants_config.dart';
import 'package:template/core/database/shared_preferences_db.dart';

import 'config/controller/http_config.dart';
import 'config/theme/app_theme.dart';
import 'core/widgets/main_wrapper.dart';
import 'locator.dart';

void main() async {
  // *  solve internet permission problem on android api < 21
  HttpOverrides.global = MyHttpOverrides();

  //? shared pref init
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesDB.init();

  //? locator
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * Force Portrait InterFace
    if (ConfigConstants.alwaysPortrait) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<ThemeCubit>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,
              home: const MainWrapper(),




              // * Force RTL, by default => (farsi,iran)
              localizationsDelegates: const [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale(ConfigConstants.language, ConfigConstants.country)
              ],
            );
          },
        ));
  }
}

