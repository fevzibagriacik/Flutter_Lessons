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
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.sunny),
            title: Text("Sun"),
            subtitle: Text("Sun Subtitle"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Sun is clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_2),
            title: Text("Moon"),
            subtitle: Text("Moon Subtitle"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Moon is clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Star"),
            subtitle: Text("Star Subtitle"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Star is clicked");
            },
          ),
          GestureDetector(
            onTap: (){
              print("Card is clicked");
            },
            child: Card(
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Text("Card Design"),
                    Spacer(),
                    Icon(Icons.more_vert),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print("Container is clicked");
            },
            child: Container(
              height: 50,
              color: Colors.red,
              child: Text("Hello"),
            ),
          ),
        ],
      ),
    );
  }
}
