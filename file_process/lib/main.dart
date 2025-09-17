import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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

  var tfInput = TextEditingController();

  Future<void> writeData() async{
    var ad = await getApplicationDocumentsDirectory();

    var appFilePath = await ad.path;

    var file = File("$appFilePath/myFile.txt");

    file.writeAsString(tfInput.text);

    tfInput.text = "";
  }

  Future<void> readData() async{
    try{
      var ad = await getApplicationDocumentsDirectory();

      var appFilePath = await ad.path;

      var file = File("$appFilePath/myFile.txt");

      String data = await file.readAsString();

      tfInput.text = data;
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> deleteData() async{
    var ad = await getApplicationDocumentsDirectory();

    var appFilePath = await ad.path;

    var file = File("$appFilePath/myFile.txt");

    if(file.existsSync()){
      file.delete();
    }
  }

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfInput,
                decoration: InputDecoration(
                  hintText: "Enter a data",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      writeData();
                    },
                    child: Text("Write"),
                ),
                ElevatedButton(
                  onPressed: (){
                    readData();
                  },
                  child: Text("Read"),
                ),
                ElevatedButton(
                  onPressed: (){
                    deleteData();
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
