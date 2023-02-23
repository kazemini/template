
import 'package:get_it/get_it.dart';
import 'package:template/config/theme/theme_cubit.dart';
import 'package:template/core/interface/app_router.dart';

GetIt locator = GetIt.instance;


setup() {
  //? app router
  locator.registerSingleton<AppRouter>(AppRouter());

  //? blocs & cubits
  locator.registerSingleton<ThemeCubit>(ThemeCubit());

}