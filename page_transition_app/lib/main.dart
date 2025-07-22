import 'package:flutter/material.dart';
import 'package:page_transition_app/PageA.dart';
import 'package:page_transition_app/PageB.dart';
import 'package:page_transition_app/Persons.dart';

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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

                  var person = Persons(name: "Ahmet", age: 18, height: 178, isMarry: false,);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          PageA(person: person,)));
                },
                child: Text("Go Page A"),
            ),
          ],
        ),
      ),
    );
  }
}
