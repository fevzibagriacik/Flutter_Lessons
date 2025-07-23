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

  int radioValue = 0;

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
            RadioListTile(
                title: Text("GS"),
                value: 1,
                groupValue: radioValue,
                activeColor: Colors.red,
                onChanged: (int? data){
                  setState(() {
                    radioValue = data!;
                  });
                  print("GS is selected");
                },
            ),
            RadioListTile(
              title: Text("FB"),
              value: 2,
              groupValue: radioValue,
              activeColor: Colors.indigo,
              onChanged: (int? data){
                setState(() {
                  radioValue = data!;
                });
                print("FB is selected");
              },
            ),
            ElevatedButton(
                onPressed: (){
                  if(radioValue == 1){
                    print("Button: GS is selected");
                  }else{
                    print("Button: FB is selected");
                  }
                }, 
                child: Text("Show"),
            ),
          ],
        ),
      ),
    );
  }
}
