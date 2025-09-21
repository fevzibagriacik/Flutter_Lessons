import 'package:flag_quiz_app_clone/QuizScreen.dart';
import 'package:flag_quiz_app_clone/ResultScreen.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                "Welcome to Quiz",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => QuizScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  child: Text("Start", style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
