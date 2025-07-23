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

  bool kotlinState = false;
  bool dartState = false;

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
            CheckboxListTile(
                title: Text("Kotlin"),
                value: kotlinState,
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.red,
                activeColor: Colors.deepPurple,
                onChanged: (bool? data){
                  print("Kotlin is selected : $data");

                  setState(() {
                    kotlinState = data!;
                  });
                },
            ),
            CheckboxListTile(
              title: Text("Dart"),
              value: dartState,
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.red,
              activeColor: Colors.deepPurple,
              onChanged: (bool? data){
                print("Dart is selected : $data");

                setState(() {
                  dartState = data!;
                });
              },
            ),
            ElevatedButton(
                onPressed: (){
                  print("Dart state : $dartState");
                  print("Kotlin state : $kotlinState");
                },
                child: Text("Show"),
            ),
          ],
        ),
      ),
    );
  }
}
