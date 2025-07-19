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
      home: const MyHomePage(title: 'Recipe'),
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
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: screenWidth,
                height: screenHeight/2,
                child: Image.asset("images/meatball2.jpg"),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: screenWidth/8,
                    child: TextButton(
                        child: TextBox("Like", screenWidth/25),
                        onPressed: (){
                          print("Liked");
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: screenWidth/8,
                    child: TextButton(
                      child: TextBox("Comment", screenWidth/25),
                      onPressed: (){
                        print("Commented");
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(screenHeight/100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Meatball",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth/20,
                    ),
        
                  ),
                  Row(
                    children: [
                      TextBox("Izgara Üzerinde Pişirme Uygun", screenWidth/25),
                      Spacer(),
                      TextBox("8 August", screenWidth/25),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenHeight/100),
              child: TextBox(
                "sdaaaaaaaaaaaaaaaaaaaaaaaaaaasdasdaaaaaaaaaaaaaaaasdasdasaaaa"
                "asdddddddddddddddddddddddddddddddddddddddddddddddddddddddddsadas"
                "asdsafasffffffffffffffffffffffffffffffffffffffffffffffffffffff",
                screenWidth/25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  String? content;
  double? size;

  TextBox(this.content, this.size);

  @override
  Widget build(BuildContext context) {
    return Text(content!, style: TextStyle(fontSize: size),);
  }
}
