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

  var tfController = TextEditingController();
  String data = "";

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
                controller: tfController,
                obscureText: true,
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                maxLength: 4,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter a text",
                  hintStyle: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                  filled: true,
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(Icons.print),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    data = tfController.text;
                  });
                },
                child: Text("Take Data"),
            ),
            Text(
                "Data: $data",
                style: TextStyle(
                  color: Colors.green,
                  backgroundColor: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
