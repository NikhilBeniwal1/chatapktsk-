import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  TextEditingController mController = TextEditingController();
  String? nameFromPref;
  int? nameFromPref2;
  Color colorValue = Colors.white;
  int? count;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNameFromPref();
    countValue();
    if (nameFromPref2 == 2) {
      colorValue = Colors.green.shade200;
    }
    if (count != null) {
      count = 1;
    } else {
      count = 1;
    }
  }

  void countValue() async {
    var prefs1 = await SharedPreferences.getInstance();
    /* nameFromPref2 = prefs1.setInt(key, value)     ;*/

    nameFromPref2 = prefs1.getInt("countValue");

    setState(() {});
  }

  void getNameFromPref() async {
    var prefs = await SharedPreferences.getInstance();
    nameFromPref = prefs.getString("name");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorValue,
      appBar: AppBar(
        title: Text("shared pref"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$count"),
          SizedBox(
            height: 10,
          ),
          Text(nameFromPref != null ? "Wellcome: $nameFromPref" : "....."),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: mController,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                var name = mController.text.toString();

                var prefs = await SharedPreferences.getInstance();
                prefs.setString("name", name);
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LottieController(),
                    ));*/
                setState(() {});
              },
              child: Text('save.'))
        ],
      ),
    );
  }
}
