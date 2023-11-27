import 'package:chatapptask/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppDatabase appDB;
  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appDB = AppDatabase.instance;
    getAllNotes();
    setState(() {});
  }

  void getAllNotes() async {
    data = await appDB.fetchNote();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Column(
        children: [
          Container(
              height: 500,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    title: Text("${data[index]["title"]}"),
                    subtitle: Text("${data[index]["desc"]}"),
                  );
                },
              )),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () async {
                appDB.addNote(
                    "new notes date 27", "Implement DB in flutter app");
                getAllNotes();
              },
              child: Text("add Notes.")),
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
              child: Text("LogOut")),
        ],
      ),
    );
  }
}
