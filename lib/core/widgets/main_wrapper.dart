import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/theme/theme_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('قالب'),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      //? here is test of AppRouter using di & extend from dynamic abstract
                      //? class, u can send anything you want to the next page
                      //? like below(Map of dynamic thing) or just int-string
                      Navigator.of(context).push(locator<AppRouter>().call(name:'/second',
                          param: {'txt1':'wellcome to second page   ;)  ','txt2':'powered by di'}));
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
      );
  }
}
