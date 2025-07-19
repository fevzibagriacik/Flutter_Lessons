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
      home: const MyHomePage(title: 'Login'),
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

    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    var screenHeight = screenInfo.size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom:screenHeight/20),
                child: SizedBox(
                    width: screenWidth / 4,
                    height: screenHeight / 6,
                    child: Image.asset("images/bank.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/30),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/30),
                child: SizedBox(
                  width: screenWidth/1.2,
                  height: screenHeight/12,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: (){
                        print("Logined...");
                      },
                      child: Text("Login", style: TextStyle(fontSize: screenWidth/25),),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("Help is selected.");
                },
                child: Text(
                  "Help ?",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth / 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
