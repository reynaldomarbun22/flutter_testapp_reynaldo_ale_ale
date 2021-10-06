import 'package:flutter/material.dart';
import 'package:flutter_testapp_reynaldo_ale_ale/Mini%20Router/router.dart';
import 'package:flutter_testapp_reynaldo_ale_ale/src/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // navigatorKey: _state,
      debugShowCheckedModeBanner: false,
      title: 'Transisi Apps',
      home: Splash(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
