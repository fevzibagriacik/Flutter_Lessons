import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_study/PageA.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> saveData() async {
    var sp = await SharedPreferences.getInstance();

    sp.setString("name", "ahmet");
    sp.setInt("age", 18);
    sp.setDouble("height", 1.78);
    sp.setBool("isMarry", false);

    List<String> friendList = [];
    friendList.add("Ece");
    friendList.add("Ali");

    sp.setStringList("friendList", friendList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){

                  saveData();

                  Navigator.push(context, MaterialPageRoute(builder: (context) => PageA()));
                },
                child: Text("Go"),
            ),
          ],
        ),
      ),
    );
  }
}
