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

  List<String> countryList = [];
  String currentCountry = "Turkey";

  @override
  void initState() {
    super.initState();

    countryList.add("Turkey");
    countryList.add("Italy");
    countryList.add("Germany");
    countryList.add("Russia");
    countryList.add("China");
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
            DropdownButton<String>(
                value: currentCountry,
                items: countryList.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text("Country: $value", style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
                  );
                }).toList(),
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String? data){
                  setState(() {
                    currentCountry = data!;
                  });
                },
            ),
            Text("Current Country: $currentCountry"),
            ElevatedButton(
                onPressed: (){
                  print("Last Choosen Country: $currentCountry");
                },
                child: Text("Show"),
            ),
          ],
        ),
      ),
    );
  }
}
