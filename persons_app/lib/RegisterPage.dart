import 'package:flutter/material.dart';
import 'package:persons_app/PersonsDao.dart';
import 'package:persons_app/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var personNameController = TextEditingController();
  var personNumberController = TextEditingController();

  Future<void> addPerson(String person_name, String person_number) async{
    PersonsDao().addPerson(person_name, person_number);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Register Person"),
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
            addPerson(personNameController.text, personNumberController.text);
          },
          icon: Icon(Icons.save),
          label: Text("Save"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
