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

  bool switchControl = false;

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
            Switch(
                value: switchControl,
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
                inactiveTrackColor: Colors.black54,
                inactiveThumbColor: Colors.black,
                onChanged: (data){
                  setState(() {
                    switchControl = data;
                  });
                  print("Switch: $data");
                },
            ),
            ElevatedButton(
                onPressed: (){
                  print("Switch State: $switchControl");
                }, 
                child: Text("Show"),
            ),
          ],
        ),
      ),
    );
  }
}
