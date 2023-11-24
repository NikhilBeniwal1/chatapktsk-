import 'package:chatapptask/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "App Open Count : $count",
              style: TextStyle(fontSize: 30),
            )),
            Center(
              child: Icon(
                Icons.home,
                size: 50,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(LoginScreen.LOGIN_PREF_KEY, false);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Text("LogOut"))
          ],
        ),
      ),
    );
  }
}
