import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/theme/theme_cubit.dart';
import 'package:template/core/interface/app_router.dart';
import 'package:template/locator.dart';



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
      appBar: AppBar(title: const Text('Template'),),
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
                    //SharedPreferencesDB.setThemeMode(ThemeEnum.light);
                    BlocProvider.of<ThemeCubit>(context).lightMode();
                  },
                  child: const Text('حالت روشن')
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).darkMode();
                  },
                  child: const Text('حالت تیره')
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
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
