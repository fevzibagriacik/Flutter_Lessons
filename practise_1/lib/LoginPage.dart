import 'package:flutter/material.dart';
import 'package:practise_1/Person.dart';
import 'package:practise_1/ProfilePage.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter a name",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                controller: surnameController,
                decoration: InputDecoration(
                  hintText: "Enter a surname",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "Enter an age",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter a password",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var person = Person(
                    name: nameController.text,
                    surname: surnameController.text,
                    age: int.parse(ageController.text)
                  );

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(person: person,)));
                },
                child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}


