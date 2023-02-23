import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/config/theme/theme_cubit.dart';

import '../../config/theme/app_theme.dart';
import '../../config/utils/constants_config.dart';
import '../../config/utils/enums_config.dart';
import '../../locator.dart';
import '../database/shared_preferences_db.dart';
import '../interface/app_router.dart';



// TODO this page only for test, pls convert to clean arch :)
//? contain page route & change theme test ;)

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

    ThemeMode getTheme() {
    int theme = SharedPreferencesDB.getThemeMode();
    late ThemeMode mode = ConfigConstants.defaultTheme;
    switch (theme) {
      case 0:
        mode = ThemeMode.light;
        break;
      case 1:
        mode= ThemeMode.dark;
        break;
      case 2:
        mode= ThemeMode.system;
        break;
    }
    return mode;
  }
  @override
  void initState() {
    BlocProvider.of<ThemeCubit>(context).changeTheme(themeMode: getTheme());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          home: Scaffold(
            appBar: AppBar(title: const Text('قالب'),),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(locator<AppRouter>().call(name:'/second'));
                        },
                        child: const Text('بریم صفحه دوم')
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          SharedPreferencesDB.setThemeMode(ThemeEnum.light);
                          BlocProvider.of<ThemeCubit>(context).lightMode();
                        },
                        child: const Text('حالت روشن')
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          SharedPreferencesDB.setThemeMode(ThemeEnum.dark);
                          BlocProvider.of<ThemeCubit>(context).darkMode();
                        },
                        child: const Text('حالت تیره')
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          SharedPreferencesDB.setThemeMode(ThemeEnum.system);
                          BlocProvider.of<ThemeCubit>(context).system();
                        },
                        child: const Text('حالت سیستم')
                    ),
                  ),
                ],
              ),
            ),
          ),

          // * Force RTL, by default => (farsi,iran)
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale(ConfigConstants.language, ConfigConstants.country)],
        );
      },
    );
  }
}
