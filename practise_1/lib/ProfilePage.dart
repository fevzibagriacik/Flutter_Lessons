import 'package:flutter/material.dart';
import 'package:practise_1/Person.dart';

class ProfilePage extends StatelessWidget {
  Person person;
  
  ProfilePage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Profile Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${person.name}"),
            Text("Name: ${person.surname}"),
            Text("Name: ${person.age}"),
          ],
        ),
      ),
    );
  }
}
