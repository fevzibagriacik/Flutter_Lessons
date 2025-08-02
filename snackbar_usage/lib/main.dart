import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Hello"),),
                  );
                },
                child: Text("Default"),
            ),
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Do you want to delete?"),
                    action: SnackBarAction(
                        label: "Yes",
                        onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Deleted"),),
                          );
                        },
                    ),
                  ),
                );
              },
              child: Text("Snackbar Action"),
            ),
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "No connection!",
                      style: TextStyle(
                        color: Colors.indigoAccent,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: "Reply",
                      textColor: Colors.red,
                      onPressed: (){
                          print("Replied");
                      },
                    ),
                  ),
                );
              },
              child: Text("Customized Snackbar"),
            ),
          ],
        ),
      ),
    );
  }
}
