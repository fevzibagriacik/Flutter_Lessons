import 'package:flutter/material.dart';
import 'package:sqlite_usage/PersonDao.dart';
import 'package:sqlite_usage/Persons.dart';

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

  Future<void> showPersons() async{
    var list = await PersonDao().allPersons();

    for(Persons p in list){
      print("*******************");
      print("Person id: ${p.person_id}" );
      print("Person name: ${p.person_name}" );
      print("Person age: ${p.person_age}" );
    }
  }

  Future<void> add() async{
    await PersonDao().addPerson("Ece", 54);
  }

  Future<void> delete() async{
    await PersonDao().deletePerson(3);
  }

  Future<void> update() async{
    await PersonDao().updatePerson(4, "New Ece", 99);
  }

  @override
  void initState() {
    super.initState();

    //add();
    //delete();
    update();
    showPersons();
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

          ],
        ),
      ),
    );
  }
}
