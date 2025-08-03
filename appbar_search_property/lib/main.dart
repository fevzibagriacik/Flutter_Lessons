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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: isSearching ? TextField(
          decoration: InputDecoration(
            hintText: "Enter a something for search",
          ),
          onChanged: (searchResult){
            print("Search Result: $searchResult");
          }
        ) : Text("Appbar Search"),
        actions: [
          isSearching ?
            IconButton(
                onPressed: (){
                  setState(() {
                    isSearching = false;
                  });
                },
                icon: Icon(Icons.cancel),
            ) :
            IconButton(
                onPressed: (){
                  setState(() {
                    isSearching = true;
                  });
                },
                icon: Icon(Icons.search),
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
