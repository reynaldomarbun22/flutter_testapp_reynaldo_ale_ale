import 'package:flutter/material.dart';
import 'package:flutter_testapp_reynaldo_ale_ale/src/addcontact.dart';
import 'package:flutter_testapp_reynaldo_ale_ale/src/homepageList.dart';
import 'package:flutter_testapp_reynaldo_ale_ale/src/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case OnBoarding.routeName:
      //   return MaterialPageRoute(
      //       settings: RouteSettings(name: OnBoarding.routeName),
      //       builder: (_) => OnBoarding());
      case LoginPage.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: LoginPage.routeName),
            builder: (_) => LoginPage());
      case HomePage.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: HomePage.routeName),
            builder: (_) => HomePage());
      case AddPage.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: AddPage.routeName),
            builder: (_) => AddPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
