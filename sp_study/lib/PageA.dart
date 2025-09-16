import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {

  Future<void> readData() async {
    var sp = await SharedPreferences.getInstance();

    String name = sp.getString("name") ?? "no name";
    int age = sp.getInt("age") ?? 99;
    double height = sp.getDouble("height") ?? 9.99;
    bool isMarry = sp.getBool("isMarry") ?? true;

    var friendList = sp.getStringList("friendList") ?? null;

    print("Ad : $name");
    print("Age : $age");
    print("Height : $height");
    print("isMarry : $isMarry");

    for(var i in friendList!){
      print("Friend : $i");
    }
  }

  Future<void> removeData() async {
    var sp = await SharedPreferences.getInstance();

    sp.remove("name");
  }

  Future<void> updateData() async {
    var sp = await SharedPreferences.getInstance();

    sp.setInt("age", 100);
  }

  @override
  void initState() {
    super.initState();

    //removeData();
    updateData();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("PageA"),
      ),
      body: Center(),
    );
  }
}
