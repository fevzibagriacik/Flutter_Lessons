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
            BlueSquare(),
            SizedBox(height: 20,),
            RedSquare(),
            SizedBox(height: 20,),
            TextBox("Hello", 30.0,),
          ],
        ),
      ),
    );
  }
}

class BlueSquare extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    );
  }
  
}

class RedSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 50, height: 50, color: Colors.red,);
  }
}

class TextBox extends StatelessWidget {
  String? content;
  double? size;

  TextBox(this.content, this.size);

  @override
  Widget build(BuildContext context) {
    return Text(content!, style: TextStyle(fontSize: size!),);
  }
}


