import 'dart:async';

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

  Timer? timer;
  int remainderTime = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Remainder Time: $remainderTime sec", style: TextStyle(fontSize: 30),),
            ElevatedButton(
                onPressed: (){
                  timer = Timer.periodic(Duration(seconds: 1), (timer){
                    setState(() {
                      if(remainderTime < 1){
                        remainderTime = 10;
                        timer.cancel();
                      }else{
                        remainderTime--;
                      }
                    });
                  });
                },
                child: Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}
