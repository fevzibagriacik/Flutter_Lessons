import 'package:dynamic_listview/DetailPage.dart';
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

  var countries = ["Turkey", "Germany", "Italy", "Russia", "China"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: countries.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                print("${countries[index]} is clicked");
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(countryName: countries[index],)));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              print("${countries[index]} is clicked with text");
                            },
                            child: Text(countries[index]),
                        ),
                        Spacer(),
                        PopupMenuButton(
                            child: Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                  value: 1,
                                  child: Text("Delete"),
                              ),
                              PopupMenuItem(
                                  value: 2,
                                  child: Text("Update"),
                              ),
                            ],
                            onSelected: (menuItemValue){
                              if(menuItemValue == 1){
                                print("${countries[index]} is deleted");
                              }

                              if(menuItemValue == 2){
                                print("${countries[index]} is updated");
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
