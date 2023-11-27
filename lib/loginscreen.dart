import 'package:chatapptask/app_database.dart';
import 'package:chatapptask/homescreen.dart';
import 'package:chatapptask/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const LOGIN_PREF_KEY = "isLogin";
  static const APP_OPEN_PREF_KEY = "app_open";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() /*async*/ {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "tap on login",
            style: TextStyle(fontSize: 35),
          )),
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setBool(LoginScreen.LOGIN_PREF_KEY, true);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text(
                    "login",
                    style: TextStyle(fontSize: 30),
                  )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var appDB = AppDatabase.instance;
          appDB.addNote("New Note", "Implement DB in flutter app");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
