import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_testapp_reynaldo_ale_ale/src/login.dart';
// import 'package:trust_fall/trust_fall.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _loading();
    super.initState();
  }

  _loading() async {
    await Future.delayed(Duration(milliseconds: 1750));

    final _agree = null;
    if (_agree == null) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
      return;
    }

    // if (!_agree) {
    //   Navigator.pushReplacementNamed(context, LoginPage.routeName);
    // } else {}
  }

  // _checkVersion() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      alignment: Alignment.center,
                      width: 250,
                      image: AssetImage('assets/images/transisi.png'),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Spacer(),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          "PT. Transisi Teknologi Mandiri Machine Learning (ML) memberikan sistem kemampuan untuk belajar dan meningkatkan kinerja aplikasi secara otomatis berdasarkan pengalaman pengguna, tanpa perlu diprogram secara eksplisit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .overline
                                  .fontSize),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Version ' + '1.0.0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Theme.of(context).textTheme.overline.fontSize),
                ),
                SizedBox(height: 16)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
