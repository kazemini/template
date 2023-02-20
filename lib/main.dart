import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/theme/app_theme.dart';

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

  @override
  Widget build(BuildContext context) {
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
            );
          },
        ));
  }
}


