import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/main.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
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
          title: Text("View"),
        ),
        body: Center(
          child: Column(children: [
            Container(
              height: 50,
              width: 100,
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.teal),
              child: Text(
                "A : $a",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            InkWell(
              onTap: () {
                a++;
                box.put("levalno",a);
                print("hello");
                setState(() {});
              },
              child: Container(
                height: 50,
                width: 100,
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.grey),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Dashboard();
              },));
            },
              child: Container(
                height: 50,
                width: 100,
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.grey),
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            //   Text("A : $a",style: TextStyle(fontSize: 30),),
            //   ElevatedButton(onPressed: () {
            //     a++;
            //     box.put("levalno", a);
            //     setState(() {
            //
            //     });
            //   }, child: Text("Submit",style: TextStyle(fontSize: 20,color: Colors.black),)),
            //   ElevatedButton(onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return  Dashboard();
            //     },));
            //   }, child: Text("Add",style: TextStyle(fontSize: 20,color: Colors.black),)),
            // ],),
          ]),
        ));
  }
}
