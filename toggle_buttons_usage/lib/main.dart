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

  var toggleStates = [false, true, false];
  int chosenToggleIndex = 0;

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
            ToggleButtons(
                children: [
                  Icon(Icons.looks_one),
                  Icon(Icons.looks_two),
                  Icon(Icons.looks_3),
                ],
                color: Colors.pink,
                selectedColor: Colors.deepPurple,
                fillColor: Colors.yellow,
                isSelected: toggleStates,
                onPressed: (int chosenIndex){
                  chosenToggleIndex = chosenIndex;
                  print("${chosenIndex+1}. toggle is selected");

                  setState(() {
                    toggleStates[chosenIndex] = !toggleStates[chosenIndex];
                  });
                },
            ),
            ElevatedButton(
                onPressed: (){
                  print("${chosenToggleIndex+1}. toggle is selected");
                },
                child: Text("Show"),
            ),
          ],
        ),
      ),
    );
  }
}
