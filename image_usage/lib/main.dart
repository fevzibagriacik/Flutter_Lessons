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

  String imageName = "django.png";

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
            //Image.asset("images/$imageName"), //From local
            //Image.network("http://kasimadalan.pe.hu/filmler/resimler/$imageName"), //From net
            FadeInImage.assetNetwork( //If image is not disappear, placeholder appears
                placeholder: "images/images.jpeg",
                image: "http://kasimadalan.pe.hu/filmler/resimler/$imageName",
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    imageName = "django.png";
                  });
                },
                child: Text("Image-1"),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  imageName = "inception.png";
                });
              },
              child: Text("Image-2"),
            ),
          ],
        ),
      ),
    );
  }
}
