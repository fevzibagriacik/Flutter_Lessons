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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'Inspire'),
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
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight/100, top: screenHeight/100),
              child: SizedBox(
                  width: screenWidth/3,
                  child: Image.asset("images/stevejobs.jpeg"),
              ),
            ),
            Text("Steve Jobs",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth/25,
              ),
            ),
            Spacer(),
            Text("Dünyayı değiştirecek insanlar, onu değiştirebileceklerini"
                " düşünecek kadar çılgın olanlardır.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth/25,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight/100),
              child: SizedBox(
                width: screenWidth/2,
                height: screenHeight/15,
                child: ElevatedButton(
                    child: Text("Inspire", style: TextStyle(fontSize: screenWidth/25),),
                    onPressed: (){
                      print("Inspired.");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
