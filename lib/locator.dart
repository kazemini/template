
import 'package:get_it/get_it.dart';
import 'package:template/core/interface/app_router.dart';

GetIt locator = GetIt.instance;


setup() {
  //? app router
  locator.registerSingleton<AppRouter>(AppRouter());
}