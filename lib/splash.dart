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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
