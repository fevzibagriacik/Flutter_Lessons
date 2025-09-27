import 'package:flutter/material.dart';
import 'package:persons_app/DetailPage.dart';
import 'package:persons_app/Persons.dart';
import 'package:persons_app/PersonsDao.dart';
import 'package:persons_app/RegisterPage.dart';

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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool isSearching = false;
  String searchWord = "";

  Future<List<Persons>> getAllPersons() async{
    var personList = await PersonsDao().getAllPersons();

    return personList;
  }

  Future<List<Persons>> searchPersons(String searchWord) async{
    var personList = await PersonsDao().searchPersons(searchWord);

    return personList;
  }

  Future<void> deletePerson(int person_id) async{
    await PersonsDao().deletePerson(person_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: isSearching ? TextField(
          onChanged: (word){
            setState(() {
              searchWord = word;
            });
          },
          decoration: InputDecoration(
            hintText: "Enter a name",
          ),
        ) : Text("Persons App"),
        actions: [
          isSearching ?
          IconButton(
            onPressed: (){
              setState(() {
                isSearching = false;
                searchWord = "";
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
          )
        ],
      ),
      body: FutureBuilder(
          future: isSearching ? searchPersons(searchWord) : getAllPersons(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var personList = snapshot.data;

              return ListView.builder(
                  itemCount: personList!.length,
                  itemBuilder: (context, index){
                    var person = personList[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DetailPage(person: person,)));
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(person.person_name!),
                            Text(person.person_number!),
                            IconButton(
                                onPressed: (){
                                  setState(() {
                                    deletePerson(person.person_id!);
                                  });
                                },
                                icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
              );
            }else{
              return Center();
            }
          },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => RegisterPage()));
            setState(() {});
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(Icons.add),
      ),
    );
  }
}
