import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';
import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () async {
/*      var prefs1 = await SharedPreferences.getInstance();
      var appcount = prefs1.setInt(SplashScreen.count, 4);*/
      var prefs = await SharedPreferences.getInstance();
      bool? checkLogin = prefs.getBool(LoginScreen.LOGIN_PREF_KEY);
      if (checkLogin != null && checkLogin) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));

        // prefs.getInt('openCount');
      }
    });
    _appOpenCount();
  }

  _appOpenCount() async {
    var prefs = await SharedPreferences.getInstance();
    var appOpenCount = prefs.getInt(LoginScreen.APP_OPEN_PREF_KEY);
    if (appOpenCount != null) {
      appOpenCount++;
    } else {
      appOpenCount = 0;
      appOpenCount++;
    }
    count = appOpenCount;
    prefs.setInt(LoginScreen.APP_OPEN_PREF_KEY, appOpenCount);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          count % 2 == 0 ? Colors.amber.shade200 : Colors.blue.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "App Open Count : $count",
            style: TextStyle(fontSize: 30),
          )),
          Center(
              child: Text(
            "splash screen",
            style: TextStyle(fontSize: 25),
          )),
          Center(
              child: Icon(
            Icons.pages,
            size: 80,
          ))
        ],
      ),
    );
  }
}
