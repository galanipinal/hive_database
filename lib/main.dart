import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/view.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  var box = await Hive.openBox('cdmi');
  runApp(MaterialApp(
    home: Dashboard(),
    debugShowCheckedModeBanner: false,
  ));
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int a = 0;
  Box box = Hive.box("cdmi");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a = box.get("levalno") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "A : $a",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  a++;
                  box.put("levalno", a);
                  setState(() {});
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return View();
                    },
                  ));
                },
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
