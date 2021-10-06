import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testapp_reynaldo_ale_ale/src/homepageList.dart';
import 'package:flutter_testapp_reynaldo_ale_ale/src/splash.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, String> _user = {};

  ///"email": "eve.holt@reqres.in",
//    "password": "cityslicka"

  login() {
    http.post("https://reqres.in/api/login", body: _user).then((res) {
      var resJson = json.decode(res.body);

      if (resJson['error'] != null) {
        Toast.show(resJson['error'], context, gravity: Toast.CENTER);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, ModalRoute.withName(Splash.routeName));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Text("Login"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (val) {
                  setState(() {
                    _user['email'] = val;
                  });
                }),
            TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (val) {
                  setState(() {
                    _user['password'] = val;
                  });
                }),
            SizedBox(
              height: 30,
            ),
            OutlineButton(
              child: Text("Login"),
              onPressed: () {
                login();
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text('Example Login Successfull'),
                  Text('Email: eve.holt@reqres.in'),
                  Text('Password: cityslicka'),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
