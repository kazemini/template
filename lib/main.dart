import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/config/theme/app_theme.dart';
import 'package:template/config/theme/constants_config.dart';

import 'config/controller/http_config.dart';
import 'config/theme/theme_cubit.dart';
import 'core/widgets/main_wrapper.dart';
import 'locator.dart';

void main() async {
  // *  solve internet permission problem on android api < 21
  HttpOverrides.global = MyHttpOverrides();

  await setup();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
     MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    // * Force Portrait InterFace
    if(ConfigConstants.alwaysPortrait){
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (themCubit) => ThemeCubit()),
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
              supportedLocales: const [Locale(ConfigConstants.language, ConfigConstants.country)],
            );
          },
        ));
  }
}


