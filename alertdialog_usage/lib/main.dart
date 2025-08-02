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
            ElevatedButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Title"),
                          content: Text("Content"),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: (){
                                print("OK is selected.");
                                Navigator.pop(context);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                  );
                },
                child: Text("Basic Alert"),
            ),
            ElevatedButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text(
                        "Customized Alert",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.indigoAccent,
                      content: SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            TextField(
                              controller: tfController,
                              decoration: InputDecoration(
                                labelText: "Data",

                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            String data = tfController.text;
                            print("Data is read: $data");
                            tfController.text = "";
                            Navigator.pop(context);
                          },
                          child: Text(
                              "Read Data",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Customized Alert"),
            ),
          ],
        ),
      ),
    );
  }
}
