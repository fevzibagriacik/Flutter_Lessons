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
        backgroundColor: Colors.red,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Title",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              "Under Title",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
        centerTitle: false,
        leading: IconButton( //left bar
            onPressed: (){
              print("Menu icon is clicked.");
            },
            icon: Icon(Icons.dehaze),
            tooltip: "Menu Icon",
        ),
        actions: [ //right bar
          TextButton(
              onPressed: (){
                print("Logout is clicked.");
              },
              child: Text("Logout", style: TextStyle(color: Colors.white),),
          ),
          IconButton(
            onPressed: (){
              print("Info is clicked.");
            },
            icon: Icon(Icons.info_outline),
            tooltip: "Info",
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Delete"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Update"),
                  value: 2,
                ),
              ],
              onSelected: (menuItemValue){
                if(menuItemValue == 1){
                  print("Delete is clicked");
                }
                if(menuItemValue == 2){
                  print("Update is clicked");
                }
              },
              child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
