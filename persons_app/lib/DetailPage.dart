import 'package:flutter/material.dart';
import 'package:persons_app/Persons.dart';
import 'package:persons_app/PersonsDao.dart';
import 'package:persons_app/main.dart';

class DetailPage extends StatefulWidget {
  Persons person;

  DetailPage({required this.person});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var personNameController = TextEditingController();
  var personNumberController = TextEditingController();

  Future<void> updatePerson(int person_id, String person_name, String person_number) async{
    await PersonsDao().updatePerson(person_id, person_name, person_number);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  void initState() {
    super.initState();

    personNameController.text = widget.person.person_name!;
    personNumberController.text = widget.person.person_number!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Detail Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextField(
                controller: personNameController,
                decoration: InputDecoration(
                  hintText: "Person Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextField(
                controller: personNumberController,
                decoration: InputDecoration(
                  hintText: "Person Number",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          updatePerson(widget.person.person_id!, personNameController.text, personNumberController.text);
        },
        icon: Icon(Icons.update),
        label: Text("Update"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
