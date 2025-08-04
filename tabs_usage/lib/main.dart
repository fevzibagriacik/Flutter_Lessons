import 'package:flutter/material.dart';
import 'package:tabs_usage/Page1.dart';
import 'package:tabs_usage/Page2.dart';
import 'package:tabs_usage/Page3.dart';

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


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: TabBar(
              indicatorColor: Colors.pink,
              labelColor: Colors.orange,
              tabs: [
                Tab(text: "One",),
                Tab(icon: Icon(Icons.looks_two, color: Colors.cyanAccent,),),
                Tab(text: "3", icon: Icon(Icons.looks_3,),),
              ],
          ),
        ),
        body: TabBarView(
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
        ),
      ),
    );
  }
}
