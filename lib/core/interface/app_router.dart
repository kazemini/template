import 'package:flutter/material.dart';
import 'package:template/core/usecase/router_usecase.dart';
import 'package:template/core/widgets/main_wrapper.dart';
import 'package:template/features/page_two_feature/second_page.dart';

class AppRouter extends RouterUsecase{

  @override
   MaterialPageRoute call({param,name}) {
    switch(name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MainWrapper());
      case '/second':
        return MaterialPageRoute(builder: (context) =>  SecondPage(data: param,));
      default:
        return MaterialPageRoute(builder: (context) => const MainWrapper());
    }
  }
}