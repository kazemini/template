import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/theme/app_theme.dart';

import 'config/theme/theme_cubit.dart';
import 'core/widgets/main_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (themCubit) => ThemeCubit()),
        ],
        child: BlocConsumer<ThemeCubit, ThemeState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: state.themeEnum.name == 'dark' ? AppTheme.darkTheme : AppTheme.lightTheme,
              home: const MainWrapper(),
            );
          },
        ));
  }
}