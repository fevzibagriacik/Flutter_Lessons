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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool control = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Coding Techniques"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //coding space
            ((){
              if(control){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    Text("True"),
                  ],
                );
              }else{
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel),
                    Text("False"),
                  ],);
              }
            }()),
            Text(control ? "True" : "False",
              style: TextStyle(
                color: control ? Colors.blue : Colors.red,
                fontSize: control ? 20 : 50,
                fontWeight: control ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    control = true;
                  });
                },
                child: Text("State-1"),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  control = false;
                });
              },
              child: Text("State-2"),
            ),
          ],
        ),
      ),
    );
  }
}
