import 'package:bottom_navigation_bar/Page1.dart';
import 'package:bottom_navigation_bar/Page2.dart';
import 'package:bottom_navigation_bar/Page3.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var pageList = [Page1(), Page2(), Page3()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
      ),
      body: pageList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_one),
                label: "One",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_two),
                label: "Two",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_3),
                label: "Three",
              ),
            ],
            backgroundColor: Colors.deepPurple,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.white,
            currentIndex: selectedIndex,
            onTap: (index){
              setState(() {
                selectedIndex = index;
              });
            },
        ),
    );
  }
}
